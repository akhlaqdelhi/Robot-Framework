import json
import requests
from faker import Faker

global auth

try:
    from robot.api.deco import keyword
    from robot.libraries.BuiltIn import BuiltIn
    import robot.libraries.BuiltIn
    import robot.api.logger as logger

    ROBOT = False
except Exception:
    ROBOT = False

faker = Faker('en_IN')
company = faker.company()
email = faker.email()
name = faker.name()


@keyword("myJson")
# def crm_dc_emi(url, sr_no, iso_time):
def retrieve_json():
    payload = json.dumps({"id":101,"name":"akhlaq","interest":["reading","studying","Learning"],"Plans":{"PlanId":"10","Days":[1,3,5]}})
    # headers = {
    #   'Content-Type': 'application/json'
    # }
    #
    # response = requests.request("POST", url, headers=headers, data=payload)
    # print(response.json())
    return payload
