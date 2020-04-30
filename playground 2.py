# i = 'things that don\'t matter android.permission.TESTING \"'
# sp = i.find("android.permission.")
# partial = i[sp:]
# x = partial.find('\"')
# print(partial[x:])
# print(i[sp:])

dict_test = {
    "test": "asdf",
    "test1": ['a', 'b']
}
print(dict_test['test1'])
dict_test['new'] = {
    'requested': 'woohoo',
    'test1': ['1', '2']
}
print(dict_test)
