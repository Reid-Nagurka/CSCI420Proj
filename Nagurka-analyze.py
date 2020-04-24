import os
import sys

#handling arguments, including w spaces
app = sys.argv[2]
tmp = []
arg_idx = 2
new_app = ""
out_file_name = sys.argv[len(sys.argv)-1]
out = open(out_file_name,"a")
while ".apk" not in sys.argv[arg_idx]:
  tmp.append(sys.argv[arg_idx])
  arg_idx += 1
  if (".apk" in sys.argv[arg_idx]):
     tmp.append(sys.argv[arg_idx])
for s in tmp:
   new_app += s + "\\ "
new_app = new_app[:-2]


#build string to run apktool
orig = ""
command = ""
if (new_app != ""):
   command = "apktool d " + new_app
   orig = new_app[:-4]
   orig = orig.replace("\\ ", " ")
else:
   command = "apktool d " + app
   orig = app[:-4]
   
os.system(command)

fName = ""

for (root, dirs, files) in os.walk(orig, topdown=True):
   for f in files:
     if (f[-6:] == ".smali"):
      fName = os.path.join(root, f)
      line_number = 0
      list_of_results = []
      with open(fName, 'r') as read_obj:
	for line in read_obj:
#helps avoid false positives. This basically finds where passwords are handled over non https serveres
	   if "http:" in line and ("Password" in line or "password" in line) and "developer" not in line and "android" not in line and "schema" not in line and "analytics" not in line and "xml" not in line and "w3" not in line:
              list_of_results.append((line_number, line.rstrip()))
           line_number += 1

           if "ALLOW_ALL_HOSTNAME_VERIFIER" in line or "AllowAllHostnameVerifier()" in line or "setDefaultHostnameVerifier" in line or "new HostnameVerifier" in line:
              list_of_results.append((line_number, line.rstrip()))
           line_number += 1

           if "new TrustManager" in line:
              list_of_results.append((line_number, line.rstrip()))
           line_number += 1
      if list_of_results != []:
	  out.write(fName + "\n")
	  out.write(str(list_of_results))
out.write("\n\n")
out.close()



