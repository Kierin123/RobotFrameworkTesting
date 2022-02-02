*** Settings ***
Documentation     This is FTP Test
Library           OperatingSystem
Library           FtpLibrary
#Resource         resource.robot

*** Variables ***
${username_standard}    standard_user
${username_lock}        locked_out_user
${username_problem}     problem_user
${username_perf}        performance_glitch_user

${password}          secret_sauce
${URL}               https://www.saucedemo.com
${BROWSER}           firefox
${WELCOME_URL}       ${URL}/inventory.html

*** Test Cases ***
[TC-FTP] Ftp login
    [Documentation]    Testing login in few cases
    ftp connect     90.130.70.73    anonymous   anonymous
    download file   1KB.zip
    ftp close
    #create directory    ./speedtest
    #copy files      ./1KB.zip   ./speedtest
    #create file     ./speedtest/README.txt      CCEL Language
    #file should not be empty    ./speedtest/README.txt


*** Keywords ***
