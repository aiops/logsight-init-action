import logsight.exceptions
from logsight.user import LogsightUser
from logsight.application import LogsightApplication
from logsight.logs import LogsightLogs
from logsight.compare import LogsightCompare
import argparse
import re

# Instantiate the parser
parser = argparse.ArgumentParser(description='Logsight Init')
parser.add_argument('--username', type=str, help='URL of logsight')
parser.add_argument('--password', type=str, help='Basic auth username')
parser.add_argument('--application_name', type=str, help='Application name')
args = parser.parse_args()
EMAIL = args.username
PASSWORD = args.password
APPLICATION_NAME = args.application_name
APPLICATION_NAME = re.sub(r'\W+', '', str(APPLICATION_NAME).lower())

user = LogsightUser(email=EMAIL, password=PASSWORD)
app_mng = LogsightApplication(user.user_id, user.token)
application_id = None

try:
    application_id = app_mng.create(APPLICATION_NAME)['applicationId']
except logsight.exceptions.Conflict as e:
    # If application_name already exists.
    for app in app_mng.lst()['applications']:
        if app['name'] == APPLICATION_NAME:
            application_id = app['applicationId']

print(application_id)
