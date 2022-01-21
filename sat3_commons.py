


import os,shutil

temp_dir_path = "./temp/"

cnf_template = """c FILE: {}.cnf
c
c DESCRIPTION: Some Test 3SAT problems for debugging and stuff
c
c NOTE: {}
c
p cnf {} {}
"""


def empty_directory(folder):
    for filename in os.listdir(folder):
        file_path = os.path.join(folder, filename)
        try:
            if os.path.isfile(file_path) or os.path.islink(file_path):
                os.unlink(file_path)
            elif os.path.isdir(file_path):
                shutil.rmtree(file_path)
        except Exception as e:
            print('Failed to delete %s. Reason: %s' % (file_path, e))

