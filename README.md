<a href="https://logsight.ai/"><img src="https://logsight.ai/assets/img/logol.png" width="150"/></a>

**Your Ally for Intelligent DevOps Pipelines**

logsight.ai infuses deep learning and AI-powered analytics to enable continuous software delivery and proactive troubleshooting.

# log-init-action

This action is used to initialize connection to logsight.ai and create an application. The action used in combination with https://github.com/aiops/log-verification-action enables comparison of logs from a new deployment of a service with the logs from the previous running deployment using
logsight.ai Stage Verifier (https://docs.logsight.ai/#/monitor_deployments/stage_verifier)

## Inputs
#### `username`
**Required**  Basic auth username.
#### `password`
**Required**  Basic auth password.
#### `application_name`
**Required** The name of the application that will be created

## Outputs

#### `apoplication_id`
The ID of the application that was be created

## Example usage

```
uses: actions/logsight-init@master
with:
  username: admin
  password: mypassword
  application-name: myapp
```