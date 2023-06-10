*** Settings ***
#Library     CryptoLibrary    %{private_key_password}    variable_decryption=False
Library     CryptoLibrary    Pinelabs@1234    variable_decryption=False

#private key which should be secret, should also be protected by a password, And the password shoudl be saved in environmnetal variable

*** Variables ***

#${enc_pwd}=    crypt:kmOI+b0cL6DLR7pf9OMSsku2jLA6wOlnI2Ip0nl8FUgReWrs2ssK2793BOoXJbLjRzVtpcXwMwaBsVptMG0=
${enc_pwd}=    crypt:sgbrmnBrx+TfsOrDmc9kEB7cYKDbYD4VlVvp2obj9wmJjNZG8C3ZMDpKEhj+58dNRu+j4Y8YNLC+legzvLU=

*** Test Cases ***

Valid Login
    [Tags]      encDec
    ${password}=    Get Decrypted Text    ${enc_pwd}  #decrypts cipher text and returns plain text
    Log    {password}= ${password}
    Suppress Logging                                  #disable Robot Framework logging
    Log         Hello-word
    Log    {password}= ${password}
    Unsuppress Logging                                #enable Robot Framework logging
    Log         Hello-word after Unsuppress Logging
    Log    {password}= ${password}
