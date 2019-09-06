import sys
sys.path.append('../')
from Utility import *

def prepare_command(path, params):
    param_str_quotes = ["'{}'".format(param) for param in params]
    params_str = ", ".join(param_str_quotes)
    file_name = get_file_name(path)
    import_class = "ipmo .\\gen-obf\\{}.ps1".format(file_name)
    execute_method = "[{}]::Execute({})".format(file_name, params_str)
    command = "\"{};{}\"".format(import_class, execute_method)
    return 'powershell -c {}'.format(command)


def test_files(path_files, params):
    return [test_file(path_file, params) for path_file in path_files]


def test_file(path, params):
    command = prepare_command(path, params)

    myCmd = os.popen(command).readlines()
    myCmd = "".join([line for line in myCmd if '\n' != line])

    file_name = get_file_name(path)
    file_name_report = "{0:20}".format(file_name)
    result = True

    if myCmd.find("ScriptContainedMaliciousContent") != -1:
        result = False

    result_str = "Passed!" if result else "Detected"

    print(file_name_report + result_str)

    return (file_name, result)


if __name__ == '__main__':

    # Create temporary out folder 
    DIR_TMP_OUT = ".\\tmp-out"
    create_directory(DIR_TMP_OUT)
    DIR_TMP_OUT_FILE = DIR_TMP_OUT + '\\file.txt'

    # Get list of files
    DIR_GEN_OBF = ".\gen-obf\\"
    path_files = get_list_files(DIR_GEN_OBF)

    # Define params
    params = ['https://raw.githubusercontent.com/leachim6/hello-world/master/j/Java.java',
                DIR_TMP_OUT_FILE]

    # Execute and get results
    results = test_files(path_files, params)

    print(results)