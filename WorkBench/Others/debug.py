import json
import requests

global auth

try:
    from robot.api.deco import keyword
    from robot.libraries.BuiltIn import BuiltIn
    import robot.libraries.BuiltIn
    import robot.api.logger as logger

    ROBOT = False
except Exception:
    ROBOT = False


@keyword("kw_help")
def crm_hybrid_po():
    payload = json.dumps({
    "externalReferenceId": "xRef7665",
    "lmsReferenceId": "45465"
    })
    headers = {
        'Content-Type': 'application/json'
    }
    repr("goin to call an API call")
    response = requests.request("POST", "https://lmstest.pinelabs.com/rest/epos/query.rest", headers=headers, data=payload)
    print(response.json())
    # return response
