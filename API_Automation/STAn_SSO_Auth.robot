*** Settings ***
Library    RequestsLibrary

*** Variables ***
${url}           https://auth.sea.test.cloud.sensormatic.com
${payload}       grant_type=password&client_id=smartexit-ui&username=aviatoradmin0360&password=Aviatoradmin%4024
&{headers}       Content-Type=application/x-www-form-urlencoded

*** Test Cases ***
Example Test
    Create Session    MySession    ${url}
    ${response}=    Post On Session    MySession    /realms/sensormatic/protocol/openid-connect/token    data=${payload}    headers=${headers}
    Log    ${response.text}


//https://notifications.google.com/g/p/ANiao5qzdsc6KiWW1Zv1AJoSmJj5_9UL7JlYQ0sVM43vbS4H79fnbzs8Fu6HIAstv4IjZdXaf6eCRr1O9LLgjpYiA6MqfDQxIEd-vs1qgcTfJLpZAR3S2c2q5hMnUH3Xgt8raFUQrTHJkanvQ3XSaidWeak_PdPsymAg4pCU6_ufgRiBgnO6JokrnRYTa7dSpGo1BBcqkm-bkMpyNonFvyGMi9K_4wP0zA
https://myaccount.google.com/communication-preferences/unsubscribe/gt/ANiao5o6WqzBXvpe0QDQ0cPYqEFZarrJX19XiBsX0ckv7vsF138WbZ9LwkHh6KsCrgC5Kj5W-IKPzmQfpAJsX2JSxXEAxaPi2UpjiT29CQiwA3VDZM7Mp0sA4m_KdTk9xu6TAWdFIq47uMkK8MKK0Q6ax554vB_kfMQCtP5sSkCpZKx9iDMy9YdkqvlWgPIHW7PJ3mykCOKGwgGQBmqj7Z0zsgbylMs7UNSN_U0S8VWsRMWQknFOhRCl_0SQXVSh7jA5TsduM33nHWYJpdriU0OSPcUNJPJcdw?utm_source=gm&utm_medium=email&auto=true