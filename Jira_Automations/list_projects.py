# This code sample uses the 'requests' library:
# http://docs.python-requests.org
import requests
from requests.auth import HTTPBasicAuth
import json

url = "https://karthikdevops251.atlassian.net/rest/api/3/project"

API_TOKEN= "ATATT3xFfGF0pgQ1ljxua-XuF1aG2Zxl501bj1PVm-SmX2KzxuMTGY_qPFpbjm9yQsbp1fVge3Za-5RMa-X52khkf3leeqSMnPI86PECFCcGEZL3J1Dml6RNGFL2QNKCd4AG_ltQK-QBY1SNbRzMvHhTmwb8R-jXRM7U2t0KW7ypZBbYY-lvGes=7DA1D2DD"

auth = HTTPBasicAuth("karthikdevops251@gmail.com", API_TOKEN)

headers = {
  "Accept": "application/json"
}

response = requests.request(
   "GET",
   url,
   headers=headers,
   auth=auth
)

# print(json.dumps(json.loads(response.text), sort_keys=True, indent=4, separators=(",", ": ")))

output = json.loads(response.text)

name = output[0] ["avatarUrls"]

print(name)