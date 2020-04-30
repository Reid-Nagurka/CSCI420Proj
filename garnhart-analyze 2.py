import os
import argparse
import re
from xml.etree import ElementTree
# apk = sys.argv[1]
# output_file = open(sys.argv[2], "w+")

### Helper Methods ###

# returns a list of suspicious file names


def addSlashSpace(folderWithSpaces):
    newAnswer = ""
    for i in str(folderWithSpaces):
        if(i == " "):
            newAnswer = newAnswer + "\\ "
        else:
            newAnswer = newAnswer + i
    return newAnswer


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


def get_suspects(list_of_all_files):
    suspects = []
    for i in list_of_all_files:
        if(i.find("R$") == -1 and i != "R.smali" and i.find(".smali") > -1):
            suspects.append(i)
    return suspects


def get_requested_persmissions(root):
    permission_list = []
    for i in root:
        if(i.tag == "uses-permission"):
            perm = i.attrib["{http://schemas.android.com/apk/res/android}name"]
            permission_list.append(perm)
    return permission_list


def internet_checker(root):
    """ returns true if the internet is required. """
    for i in root:
        if(i.tag == "uses-permission" and i.attrib["{http://schemas.android.com/apk/res/android}name"] == "android.permission.INTERNET"):
            return True
    return False


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


def http_usage(file_path, output_file):
    """ returns -1 if the file has only http usage, 0 if the file has a mix, 1 if both. Null otherwise """

    errors = 0

    # setup some stuff
    file = open(file_path)
    http = False
    https = False
    count = 1

    # loop through each line
    for i in file.readlines():

        if(i.find("http") > -1 or i.find("http") > -1):

            http = True
            errors = errors + 1
            if(i.find("onReceivedSslError") > -1):
                output_file.write(
                    "   The error noted immediately below may be a false positive in reference to an \'onReceivedSslError\' function call.\n")

        if(i.find("https") > -1 or i.find("https") > -1):
            https = True

        count = count + 1

    if(https and http):
        output_file.write(
            " Mixed http and https usage was found in " + file_path+" \n")

    elif(http):
        output_file.write(" Only http usage was found in " + file_path+" \n")

    file.close()

    return errors


def trust_manager_usage(file_path, output_file):
    naughty_trust_managers = ["AcceptAllTrustM",
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

    error_count = 0
    for trust_manager in naughty_trust_managers:
        count = 1
        file = open(file_path)
        for i in file.readlines():
            if(i.find(trust_manager) > -1):
                error_count = error_count + 1
                output_file.write("Improper trust manager usage used on line " +
                                  str(count)+" with the manager labeled " + trust_manager+".")
        file.close()

    if(error_count > 0):
        output_file.write(
            "   Trust Managers were misused in this file "+str(error_count)+" times.")

    return error_count


def custom_ssl_validation(file_path, output_file):
    search_string = "org.apache.http.conn.ssl.AllowAllHostnameVerifier"
    bad_class_name_one = "FakeHostnameVerifier"
    bad_class_name_two = "NaiveHostnameVerifier"
    bad_class_name_three = "AcceptAllHostnameVerifier"
    search_string_alt = "ALLOW_ALL_HOSTNAME_VERIFIER"
    error_count = 0
    file = open(file_path)
    count = 0
    for i in file.readlines():
        count = count + 1
        if(i.find(search_string) > -1 or i.find(bad_class_name_one) > -1 or i.find(bad_class_name_two) > -1 or i.find(bad_class_name_three) > -1 or i.find(search_string_alt) > -1):
            print("Found custom ssl validation string that's super bad.")
            error_count = error_count + 1
            output_file.write("\nAllows all hostnames on line " +
                              str(count) + " in the file "+file_path+"\n")
    file.close()
    return error_count


def ssl_socket_usage(file_path, output_file):
    naughty_ssl_socket_factories = ["AcceptAllSSLSocketF",
                                    "AllTrustingSSLSocketF",
                                    "AllTrustSSLSocketF",
                                    "AllSSLSocketF",
                                    "DummySSLSocketF",
                                    "EasySSLSocketF",
                                    "FakeSSLSocketF",
                                    "InsecureSSLSocketF",
                                    "NonValidatingSSLSocketF",
                                    "NaiveSslSocketF",
                                    "SimpleSSLSocketF",
                                    "SSLSocketFUntrustedCert",
                                    "SSLUntrustedSocketF",
                                    "TrustAllSSLSocketF",
                                    "TrustEveryoneSocketF",
                                    "NaiveTrustManagerF",
                                    "LazySSLSocketF",
                                    "UnsecureTrustManagerF"]
    error_count = 0
    for ssl_socket in naughty_ssl_socket_factories:
        count = 1
        file = open(file_path)
        for i in file.readlines():
            if(i.find(ssl_socket) > -1):
                error_count = error_count + 1
                output_file.write("Improper ssl socket factory usage used on line " +
                                  str(count)+" with the factory labeled " + ssl_socket+".")
        file.close()

    if(error_count > 0):
        output_file.write(
            "   SSL socket factories were misused in this file "+str(error_count)+" times.")
        output_file.write("\n")

    return error_count


def does_trust_all_certs(file_path, output_file):
    file = open(file_path)
    trust_everyting = False
    count = 1
    for i in file.readlines():
        if(i.find("trustAllCerts") > -1):
            output_file.write(
                "\nA \'trustAllCerts\' command was found on line " + str(count)+" in the file found here: "+file_path+".")
            output_file.write("\n")
            trust_everyting = True
        count = count + 1

    if(trust_everyting):
        output_file.write(
            file_path+" was found to trust all certificates. As this test literally just looks for a string, it could be incorrect.")
        output_file.write("\n")
        output_file.write("\n")

        return 1
    else:

        return 0

# Core Program


parser = argparse.ArgumentParser(description="parser for apk analysis tool")
parser.add_argument('-i', help="path to apk file to analyze")
parser.add_argument(
    '-o', help="name of analysis file to be created. should be in txt format")

args = parser.parse_args()
apk = args.i

useSpaces = False
apkWithSpaces = ""
if(args.i.find(" ") > -1):
    useSpaces = True
    print("Yikes found a space")
    apkWithSpaces = addSlashSpace(apk)


folderNameIndex = apk.find(".apk")
folderName = apk[0:folderNameIndex]

# create the output file
output_file = open(args.o, "w+")


# unpack the project
if(useSpaces):
    os.system("apktool d " + apkWithSpaces)
else:
    os.system("apktool d "+apk)


# get manifest and parse
tree = ElementTree.parse(folderName+"/AndroidManifest.xml")
root = tree.getroot()
package_name = root.attrib['package']
# check if the app uses internet. if it doesn't, then don't continue
requires_internet = internet_checker(root)
remaining_permissions = get_requested_persmissions(root)
print("Permissions Requested for "+folderName)
print(remaining_permissions)
print("Requesting this many permissions "+str(len(remaining_permissions)))

# replace periods with slashes for easy file parsing. move to the smali file area
# package_name_slashes = folderName+"/smali/" + package_name.replace(".", "/")
package_name_slashes = folderName+"/smali"
list_of_files = get_all_file_paths(package_name_slashes)
files_to_investigate = get_suspects(list_of_files)


files_with_vulnerabilities = []


total_errors = 0
output_file.write("This report analyzes " +
                  str(len(files_to_investigate))+" files.\n")

for file_path in files_to_investigate:
    # output_file.write("Analyzing " + file_path+"\n")

    # file_error_count = http_usage(
    #     file_path, output_file) + trust_manager_usage(file_path, output_file) + ssl_socket_usage(file_path, output_file) + does_trust_all_certs(file_path, output_file) + custom_ssl_validation(file_path, output_file)
    # total_errors = total_errors + file_error_count

    remaining_permissions = overstated_permissions(
        file_path, remaining_permissions)

    # if(file_error_count > 0):
    #     files_with_vulnerabilities.append(file_path)

print("Permissions not used: ")
print(remaining_permissions)
print("Amount of permissions not used: "+str(len(remaining_permissions)))
output_file.write("\n")
# print(files_with_vulnerabilities)
print("Total errors found: " + str(total_errors))
output_file.write("Total possible errors found " + str(total_errors))


# os.chdir(package_name_slashes)

# Safe to only check non-R files.

# get the package name
root = ElementTree.parse
