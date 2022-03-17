<a href="https://logsight.ai/"><img src="https://logsight.ai/assets/img/logol.png" width="150"/></a>

**Your Ally for Intelligent DevOps Pipelines**

logsight.ai infuses deep learning and AI-powered analytics to enable continuous software delivery and proactive troubleshooting.

# log-init-action

This action is used to initialize connection to logsight.ai and create an application. The action used in combination with https://github.com/aiops/log-verification-action enables comparison of logs from a new deployment of a service with the logs from the previous running deployment using
logsight.ai Stage Verifier (https://docs.logsight.ai/#/monitor_deployments/stage_verifier)

## Inputs
```text
  username:
    description: 'Basic auth username.'
    required: true
  password:
    description: 'Basic auth password.'
    required: true
  application_name:
    description: 'Application name.'
    required: false
    default: ${{ github.ref }}
  tag:
    description: 'Tag that refers to the current version of your software (e.g., {{ $github.sha }})'
    required: false
    default: ${{ github.sha }}
  fluentbit_enable:
    description: 'Flag that enables or disables FluentBit log collection. If disabled, please make sure you have your own input that forwards logs to logsight.ai (https://docs.logsight.ai/#/./send_logs/fluentbit).'
    required: false
    default: 1
  fluentbit_inputname:
    description: 'FluentBit inputs (https://docs.fluentbit.io/manual/pipeline/inputs)'
    required: false
    default: 'tail'
  fluentbit_filelocation:
    description: 'FluentBit file location if using tail as input (https://docs.fluentbit.io/manual/pipeline/inputs/tail)'
    required: false
    default: '/containers/*/*.log'
  fluentbit_matchpattern:
    description: 'FluentBit match pattern. Use * if you want match all messages (https://docs.fluentbit.io/manual/concepts/key-concepts#match)'
    required: false
    default: '*'
  fluentbit_message:
    description: 'FluentBit message string that specifies the Key that contains the log message. (e.g., if using Tail messages automatically have the Key message)'
    required: false
    default: 'message'
  fluentbit_host:
    description: 'Logsight URL. Use logsight.ai for the web service, or 127.0.0.1 for an on-premise solution'
    required: false
    default: 'demo.logsight.ai'
  fluentbit_port:
    description: 'Logsight PORT. Use 443'
    default: '443'
```

## Outputs

#### `apoplication_id`
The ID of the application that was be created

## Example usage

```
uses: aiops/logsight-init-action@main
id: logsight-init
with:
  username: {{ secrets.LOGSIGHT_USERNAME }}
  password: {{ secrets.LOGSIGHT_PASSWORD }}
  application_name: ${{ github.ref }}
  tag: ${{ github.sha }}
  
#the rest of the inputs can be set optionally but also used as default.
```