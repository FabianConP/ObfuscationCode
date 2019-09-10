import os
import shutil
import random

def create_directory(path):
    try:
        if not os.path.exists(path):
            os.mkdir(path)
    except OSError:
        print ("Creation of the directory %s failed" % path)


def delete_directory(path):
    try:
        if os.path.exists(path):
            shutil.rmtree(path)
    except OSError:
        print ("Delete of the directory %s failed" % path)


def restart_directory(path):
    try:
        delete_directory(path)
        create_directory(path)
    except OSError:
        print ("Restart of the directory %s failed" % path) 


def get_list_files(path, shuffle=True):
    files = [path + f for f in os.listdir(path)]
    if shuffle:
        random.shuffle(files)
    return files


def get_file_name(path):
    start_file_name = path.rfind("\\")
    end_file_name = path.rfind(".")
    return path[start_file_name + 1 :end_file_name]


def file_exists(path):
    return os.path.exists(path)
