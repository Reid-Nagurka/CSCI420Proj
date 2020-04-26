def internet_checker(root):
    """ returns true if the internet is required. """
    for i in root:
        if(i.tag == "uses-permission" and i.attrib["{http://schemas.android.com/apk/res/android}name"] == "android.permission.INTERNET"):
            return True
    return False
