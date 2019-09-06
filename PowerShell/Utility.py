import os

def create_directory(path):
    try:
        if not os.path.exists(path):
            os.mkdir(path)
    except OSError:
        print ("Creation of the directory %s failed" % path)


def get_list_files(path):
    return [path + f for f in os.listdir(path)]


def get_file_name(path):
    start_file_name = path.rfind("\\")
    end_file_name = path.rfind(".")
    return path[start_file_name + 1 :end_file_name]
