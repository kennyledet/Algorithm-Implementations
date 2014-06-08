import pathlib

def fix_tag_file(tagfile):
    print("Fixing", tagfile)
    with tagfile.open() as f:
        by_comma = list(map(lambda tag: tag.strip('\n')+'\n', f.read().split(',')))
        if len(by_comma) == 1:
            return

        print (by_comma)
        f.writelines(by_comma)




cdir = pathlib.Path('.')
subdirs = [subdir for subdir in cdir.iterdir() if subdir.is_dir()]

print (subdirs)

for subdir in subdirs:
    tagfile = subdir / 'tags'
    if tagfile.exists():
        fix_tag_file(tagfile)


