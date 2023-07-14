import requests
import json

url = "https://lmstest.pinelabs.com/rest/epos/query.rest"

payload = json.dumps({
  "externalReferenceId": "xRef7665",
  "lmsReferenceId": "45465"
})
headers = {
  'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.text)
