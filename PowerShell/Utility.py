import os
import shutil
import random
import winreg
import re

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


def prepare_command(path, params):
    param_str_quotes = ["'{}'".format(param) for param in params]
    params_str = ", ".join(param_str_quotes)
    file_name = get_file_name(path)
    import_class = "ipmo .\\gen-obf\\{}.ps1".format(file_name)
    execute_method = "[{}]::Execute({})".format(file_name, params_str)
    command = "\"{};{}\"".format(import_class, execute_method)
    return 'powershell -c {}'.format(command)


def test_files(path_files, params, test_file_method):
    results = []
    for path_file in path_files:
        results.append(test_file_method(path_file, params))
    return results


def get_HKCU_registry_key(key_name):
    key = winreg.OpenKey(winreg.HKEY_CURRENT_USER, 
                        r'SOFTWARE\Microsoft\Windows\CurrentVersion\Run', 
                        0, 
                        winreg.KEY_READ)

    for i in range(winreg.QueryInfoKey(key)[1]):
        key_entry = winreg.EnumValue(key, i)
        if key_entry[0] == key_name:
            return key_entry
        
    return None


def exists_HKCU_registry_key(key_name):
    key_entry = get_HKCU_registry_key(key_name)
    if key_entry and key_entry[0] == key_name:
        return True
    return False


def get_HKCU_registry_key_value(key_name):
    key_entry = get_HKCU_registry_key(key_name)
    if key_entry:
        return key_entry[1]
    return None



def execute_cmd(command, log_command = False):
    cmd = os.popen(command)
    cmd_lines = cmd.readlines()
    if log_command:
        print(command)
    return "".join([line for line in cmd_lines if '\n' != line])