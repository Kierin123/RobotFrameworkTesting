*** Settings ***
Documentation     This is FTP Test
Library           OperatingSystem
Library           FtpLibrary

*** Variables ***
${username}          anonymous
${password}          anonymous
${URL}               128.148.32.111
${FILE_FTP}          spec.txt
${FILE_FTP1}         examples.txt
${FTP_DIR}           /pub/ccel
${DIR}               ./spec/
${FILE}              README.txt

*** Test Cases ***
[TC-FTP] Ftp download
    [Documentation]    Testing FTP server download files
    FTP Download File   ${FTP_DIR}  ${FILE_FTP}
    FTP Download File   ${FTP_DIR}  ${FILE_FTP1}
    create directory    ${DIR}
    directory should exist  ${DIR}
    copy files      ./${FILE_FTP}   ./${DIR}
    copy files      ./${FILE_FTP1}   ./${DIR}
    create file     ${DIR}/${FILE}    CCEL Language
    file should not be empty    ${DIR}${FILE}
    file should not be empty    ${DIR}${FILE_FTP}
    file should not be empty    ${DIR}${FILE_FTP1}

*** Keywords ***
FTP Download File
    [Arguments]     ${dir_name}     ${file_name}
    ftp connect     ${URL}    ${username}   ${password}
    cwd             ${dir_name}
    download file   ${file_name}
    ftp close

