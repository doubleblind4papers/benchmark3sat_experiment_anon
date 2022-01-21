

import os
from distutils.dir_util import copy_tree

from sat3_commons import empty_directory
from sat3_generator import generate_custom_problems
from sat3_to_membership import make_membership_for_problems
from sat3_calls import experiment

prob_uf20_path = "./uf20/"
gen_custom_path = "./gen_custom/"
gen_u20_path = "./gen_uf20/"


def try_mkdir(dir_path):
    try:
        os.mkdir(dir_path)
    except FileExistsError:
        pass

def benchmarks_3sat():
    generate_custom_problems(gen_custom_path)
    make_membership_for_problems(gen_custom_path, gen_custom_path)
    experiment(gen_custom_path, "sat_membership_experiment_custom", 5)

    empty_directory(gen_u20_path)
    copy_tree(prob_uf20_path, gen_u20_path)
    make_membership_for_problems(gen_u20_path, gen_u20_path)
    experiment(gen_u20_path, "sat_membership_experiment_uf20", 5)

if __name__ == '__main__':
    try_mkdir("./temp/")
    try_mkdir(gen_custom_path)
    try_mkdir(gen_u20_path)

    benchmarks_3sat()

