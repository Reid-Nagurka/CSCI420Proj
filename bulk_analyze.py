import os
import shutil
import argparse
import re
import json
from xml.etree import ElementTree


def get_all_file_paths(root_folder_path):
    """Given the root folder, this will go through all folders within this folder and return a list of files i guess"""
    files_and_directory_list = os.listdir(root_folder_path)

    only_files = []
    for i in files_and_directory_list:
        if(os.path.isdir(root_folder_path+"/"+i)):
            only_files.extend(get_all_file_paths(root_folder_path+"/"+i))
        else:
            only_files.append(root_folder_path+"/"+i)
    return only_files


def get_requested_persmissions(root):
    permission_list = []
    for i in root:
        if(i.tag == "uses-permission"):
            perm = i.attrib["{http://schemas.android.com/apk/res/android}name"]
            permission_list.append(perm)
    return permission_list


def get_suspects(list_of_all_files):
    suspects = []
    for i in list_of_all_files:
        if(i.find("R$") == -1 and i != "R.smali" and i.find(".smali") > -1):
            suspects.append(i)
    return suspects


def overstated_permissions(file_path, remaining_permissions):
    file = open(file_path)

    for i in file.readlines():
        if(i.find("android.permission") > -1):
            # print("Finding something...")
            starting_point = i.find("android.permission.")

            sub = i[starting_point:]

            space_index = sub.find(" ")
            quote_index = sub.find('\"')

            used_permission = ""

            if(space_index > -1 and quote_index > -1):
                chosen_position = min(space_index, quote_index)
                used_permission = sub[:chosen_position]
                # print(used_permission)
            elif(quote_index > -1):
                used_permission = sub[:quote_index]
                # print(used_permission)
            else:
                used_permission = sub[:space_index]
                # print(used_permission)

            if(str(used_permission) is not "" and str(used_permission) in remaining_permissions):
                remaining_permissions.remove(used_permission)

    file.close()
    return remaining_permissions


def hostname_check(file_path):
    host_name_flags = ["org.apache.http.conn.ssl.AllowAllHostnameVerifier",
                       "FakeHostnameVerifier",
                       "NaiveHostnameVerifier",
                       "AcceptAllHostnameVerifier",
                       "ALLOW_ALL_HOSTNAME_VERIFIER"]

    file = open(file_path)
    count = 0
    for i in file.readlines():
        if(i.find(host_name_flags[0]) > -1 or i.find(host_name_flags[1]) > -1 or i.find(host_name_flags[2]) > -1 or i.find(host_name_flags[3]) > -1 or i.find(host_name_flags[4]) > -1):
            # print("OH MY GOD LOOK AT IT GO HOLY SHIT WE FOUND ONE")
            count = count + 1

    file.close()
    return count

def certificate_check(file_path):
    cert_flags = ["AcceptAllTrustM",
                              "AllTrustM",
                              "DummyTrustM",
                              "EasyX509TrustM",
                              "FakeTrustM",
                              "FakeX509TrustM",
                              "FullX509TrustM",
                              "NaiveTrustM",
                              "NonValidatingTrustM",
                              "NullTrustM",
                              "OpenTrustM",
                              "PermissiveX509TrustM",
                              "SimpleTrustM",
                              "SimpleX509TrustM",
                              "TrivialTrustM",
                              "TrustAllManager",
                              "TrustAllTrustM",
                              "TrustAnyCertTrustM",
                              "UnsafeX509TrustM",
                              "VoidTrustM"]
    file = open(file_path)
    count = 0
    check = False
    for i in file.readlines():
        if (i.find("sslContext.init(") > -1 and i.find("new TrustManager[]") > -1):
            count = count + 1
            check = True
        if (not check):
            for x in range(0, len(cert_flags)):
                if(i.find(cert_flags[x]) > -1):
                    count = count + 1

        check = False
    file.close()
    return count

def run_activity_checker(file_path, file_name_list):
    file = open(file_path)
    result_list = []
    for i in file.readlines():
	if(i.find("startActivity") > -1):
	   #now need to filter out if the activity is not in the zuum path
	   starting_point = i.find("startActivity")
	   sub = i[:starting_point]
	   left_text = sub.partition(";")[0]
	   div = left_text.partition("/")[2]
	   tmp = div
	   while "" != div:
	      tmp = div
	      div = div.partition("/")[2]
	   
	   #print("left_text:" + left_text)
	   #print("temp:")
	   #print(tmp)
	   #print(left_text)
	   #print("i" + i)
	   #tmp has the single filename
           #values to discard: Activity (generic), Context, Intent empty
	   if (tmp not in file_name_list and "$" not in tmp and tmp != 'Activity' and tmp != 'Context' and tmp != '' and tmp != 'Intent'):
	      result_list.append(tmp)
    return len(result_list)


def run_individual_analysis(apk_path):
    # prevent bug by only allowing this to happen if it's actually an apk file.
    if(apk_path[len(apk_path)-4:] != ".apk"):
        print("attempted to run an apk analysis on non apk file")
        return

    # instantiate dictionary item for recording
    individual_results = {
        'name': apk_path,
        'permissions_requested': [],
        'permissions_requested_count': 0,
        'permissions_not_utilized_count': 0,
        'unutilized_permission_list': [],
        'unused_decimal': 0,
        'hostname_errors_count': 0,
	'activity_calls_outside_app': 0,
        'certificate_violations': 0
    }

    # unpack
    os.system("apktool d " + apk_path)

    # isolate folder name (e.g. remove .apk)
    folderNameIndex = apk.find(".apk")
    folderName = apk[0:folderNameIndex]

    tree = ElementTree.parse(folderName+"/AndroidManifest.xml")
    root = tree.getroot()
    # package_name = root.attrib['package']

    # begin permission testing
    remaining_permissions = get_requested_persmissions(root)
    rem_perm_copy = get_requested_persmissions(root)
    individual_results['permissions_requested'] = rem_perm_copy
    individual_results['permissions_requested_count'] = len(
        remaining_permissions)

    results['total_permissions_requested'] += len(remaining_permissions)

    # initiate files to investigate within apk
    package_name_slashes = folderName+"/smali"
    list_of_files = get_all_file_paths(package_name_slashes)
    files_to_investigate = get_suspects(list_of_files)

    #activity checker
    #generate list of file names just once, here
    file_name_list = []
    for x in files_to_investigate:
       if(x.find(".smali") > -1 and x.find("$") < 0):
          starting_point = x.find(".smali")
          sub = x[:starting_point]
	  #left_text = sub.partition("/")[0]
	  div = sub.partition("/")[2]
	  tmp = div
	  while "" != div:
	     tmp = div
	     div = div.partition("/")[2]
          file_name_list.append(tmp)
    #run_activity_checker(files_to_investigate[0], file_name_list)
    cert_violations = 0

    # run through all files
    for file_path in files_to_investigate:
        # update remaining permissions
        remaining_permissions = overstated_permissions(
            file_path, remaining_permissions)
        
        #individual_results[activity_calls_outside_app] += run_activity_checker
#	    (file_path, file_name_list)
	activity_count = run_activity_checker(file_path, file_name_list)
	individual_results['activity_calls_outside_app'] = activity_count
        if (activity_count > 0):
            results['total_apps_activities_outside_app'] += 1
        cert_violations = certificate_check(file_path)
        if (cert_violations > 0):
            results['total_apps_cert_violation'] += 1
            if (cert_violations > 1):
                results['apps_more_than_one_cert_violation'] += 1

	
        individual_results['certificate_violations'] += cert_violations     

	individual_results['hostname_errors_count'] += hostname_check(
            file_path)

    # update dictionary with post analysis results
    individual_results['unutilized_permission_list'] = remaining_permissions
    individual_results['permissions_not_utilized_count'] = len(
        remaining_permissions)
    individual_results['unused_decimal'] = individual_results['permissions_not_utilized_count'] / \
        individual_results['permissions_requested_count']

    # last thing to do is update results
    results['total_permissions_not_utilized'] += len(remaining_permissions)
    results['total_activities_outside_app'] += individual_results['activity_calls_outside_app']
    results['total_certificate_violations'] += individual_results['certificate_violations']

    results[apk_path] = individual_results
    
    


# RUN WITH bulk_analyze.py -i FOLDERNAME
parser = argparse.ArgumentParser(description="parser for apk analysis tool")
parser.add_argument('-i', help="path to apk file to analyze")
parser.add_argument(
    '-o', help="name of analysis file to be created. should be in txt format")

args = parser.parse_args()
host_folder = args.i

os.chdir(host_folder)

apks_to_analyze = get_all_file_paths(os.getcwd())

# works up to here.
# for each apk, do what we did in garnhart analyze.py

# let's make a dictionary to store our data
results = {
    "total_scanned": 0,
    'total_permissions_requested': 0,
    "average_permissions_requested": 0,
    'total_permissions_not_utilized': 0,
    "average_permissions_not_utilized": 0,
    'total_activities_outside_app': 0,
    'total_apps_activities_outside_app': 0,
    'total_certificate_violations': 0,
    'total_apps_cert_violation': 0,
    'apps_more_than_one_cert_violation': 0
}

for apk in apks_to_analyze:
    if(apk.find(".apk") >= 0):
        print(os.getcwd())
        results['total_scanned'] += 1
        run_individual_analysis(apk)
        # delete folder name (apk without .apk)
        folderNameIndex = apk.find(".apk")
        folderName = apk[0:folderNameIndex]
        shutil.rmtree(folderName)

total_scans = results['total_scanned']
total_permits_req = results['total_permissions_requested']
total_unused_permits = results['total_permissions_not_utilized']

results['average_permissions_requested'] = total_permits_req / total_scans
results['average_permissions_not_utilized'] = total_unused_permits / total_scans

# i love json. it's the best. I'm going to change our results to a json object for easy viewing in a browser
results_json = json.dumps(results)
print(results_json)
