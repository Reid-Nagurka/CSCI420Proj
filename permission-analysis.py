def internet_checker(root):
    """ returns true if the internet is required. """
    for i in root:
        if(i.tag == "uses-permission" and i.attrib["{http://schemas.android.com/apk/res/android}name"] == "android.permission.INTERNET"):
            return True
    return False


def get_requested_persmissions(root):
    permission_list = []
    for i in root:
        if(i.tag == "uses-permission"):
            perm = i.attrib["{http://schemas.android.com/apk/res/android}name"]
            permission_list.append(perm)
    return permission_list
