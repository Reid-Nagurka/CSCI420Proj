import os
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

    return remaining_permissions


def run_individual_analysis(apk_path):
    # instantiate dictionary item for recording
    individual_results = {
        'name': apk_path,
        'permissions_requested': [],
        'permissions_requested_count': 0,
        'permissions_not_utilized_count': 0,
        'unutilized_permission_list': [],
        'unused_decimal': 0
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
    individual_results['permissions_requested'] = remaining_permissions
    individual_results['permissions_requested_count'] = len(
        remaining_permissions)

    results['total_permissions_requested'] += len(remaining_permissions)

    # initiate files to investigate within apk
    package_name_slashes = folderName+"/smali"
    list_of_files = get_all_file_paths(package_name_slashes)
    files_to_investigate = get_suspects(list_of_files)

    # run through all files
    for file_path in files_to_investigate:
        # update remaining permissions
        remaining_permissions = overstated_permissions(
            file_path, remaining_permissions)

    # update dictionary with post analysis results
    individual_results['unutilized_permission_list'] = remaining_permissions
    individual_results['permissions_not_utilized_count'] = len(
        remaining_permissions)
    individual_results['unused_decimal'] = individual_results['permissions_not_utilized_count'] / \
        individual_results['permissions_requested_count']

    # last thing to do is update results
    results['total_permissions_not_utilized'] += len(remaining_permissions)

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
}

for apk in apks_to_analyze:
    results['total_scanned'] += 1
    run_individual_analysis(apk)

total_scans = results['total_scanned']
total_permits_req = results['total_permissions_requested']
total_unused_permits = results['total_permissions_not_utilized']

results['average_permissions_requested'] = total_permits_req / total_scans
results['average_permissions_not_utilized'] = total_unused_permits / total_scans

# i love json. it's the best. I'm going to change our results to a json object for easy viewing in a browser
results_json = json.dumps(results)
print(results_json)
