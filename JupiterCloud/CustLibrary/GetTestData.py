import os
import os.path as path
import requests
import json
parent_dir = os.path.dirname(os.path.realpath('..'))
test_data_dir = os.path.join(parent_dir, 'JupiterCloud/test_data')

class GetTestData:
    def _get_messaging_payload(self, identifier):
        json_payload_file = test_data_dir + "\\contact_test_data.json"
        json_payload = open(json_payload_file)
        payload_object = json.loads(json_payload.read())
        payload = json.dumps(payload_object[environment])
        return payload