# Note
# Please continue to use jcla1's add_tag_files script
# This is meant purely for the web app to use to make parsing the tags easier

import pathlib

def fix_tag_file(tagfile):
    print("Fixing", tagfile)
    with tagfile.open() as f:
        by_comma = list(map(lambda tag: tag.capitalize().strip('\n')+'\n', f.read().split(',')))
        if len(by_comma) == 1:
            return

    with tagfile.open('w') as f:
        print (by_comma)
        f.writelines(by_comma)




cdir = pathlib.Path('.')
subdirs = [subdir for subdir in cdir.iterdir() if subdir.is_dir()]

print (subdirs)

for subdir in subdirs:
    tagfile = subdir / 'tags'
    if tagfile.exists():
        fix_tag_file(tagfile)


