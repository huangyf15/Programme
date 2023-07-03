./cerr.exe > cout.log 
./cerr.exe >> cout_add.log
./cerr.exe 1 > cout1.log
./cerr.exe 1 >> cout1_add.log
./cerr.exe 2 > cerr.log
./cerr.exe 2 >> cerr_add.log
./cerr.exe > cout+err.log 2>&1
./cerr.exe >> cout+err_add.log 2>&1

