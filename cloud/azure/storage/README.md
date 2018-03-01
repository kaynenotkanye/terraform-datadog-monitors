Azure Storage DataDog monitors
==============================

How to use this module
----------------------

```
module "datadog-monitors-azure-storage" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/azure/storage?ref={revision}"

  message = "${module.datadog-message-alerting.alerting-message}"
  environment = "${var.environment}"
}
```

Purpose
-------
Creates a DataDog monitors with the following checks :

* Service availability
* End to end latency
* Minimum successful requests
* Maximum timeout error requests
* Maximum network error requests
* Maximum throttling error requests
* Maximum server other error requests
* Maximum client other error requests
* Maximum authorization error requests

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| authorization_error_requests_silenced | Groups to mute for Storage authorization errors monitor | map | `<map>` | no |
| authorization_error_requests_threshold_critical | Maximum acceptable percent of authorization error requests for a storage | string | `90` | no |
| authorization_error_requests_threshold_warning | Warning regarding acceptable percent of authorization error requests for a storage | string | `50` | no |
| availability_silenced | Groups to mute for Storage availability monitor | map | `<map>` | no |
| availability_threshold_critical | Minimum acceptable percent of availability for a storage | string | `50` | no |
| availability_threshold_warning | Warning regarding acceptable percent of availability for a storage | string | `90` | no |
| client_other_error_requests_silenced | Groups to mute for Storage other errors monitor | map | `<map>` | no |
| client_other_error_requests_threshold_critical | Maximum acceptable percent of client other error requests for a storage | string | `90` | no |
| client_other_error_requests_threshold_warning | Warning regarding acceptable percent of client other error requests for a storage | string | `50` | no |
| delay | Delay in seconds for the metric evaluation | string | `600` | no |
| environment | Architecture environment | string | - | yes |
| filter_tags_custom | Tags used for custom filtering when filter_tags_use_defaults is false | string | `*` | no |
| filter_tags_use_defaults | Use default filter tags convention | string | `true` | no |
| latency_silenced | Groups to mute for Storage latency monitor | map | `<map>` | no |
| latency_threshold_critical | Maximum acceptable end to end latency (ms) for a storage | string | `2000` | no |
| latency_threshold_warning | Warning regarding acceptable end to end latency (ms) for a storage | string | `1000` | no |
| message | Message sent when a Redis monitor is triggered | string | - | yes |
| network_error_requests_silenced | Groups to mute for Storage network errors monitor | map | `<map>` | no |
| network_error_requests_threshold_critical | Maximum acceptable percent of network error requests for a storage | string | `90` | no |
| network_error_requests_threshold_warning | Warning regarding acceptable percent of network error requests for a storage | string | `50` | no |
| server_other_error_requests_silenced | Groups to mute for Storage server other errors monitor | map | `<map>` | no |
| server_other_error_requests_threshold_critical | Maximum acceptable percent of server other error requests for a storage | string | `90` | no |
| server_other_error_requests_threshold_warning | Warning regarding acceptable percent of server other error requests for a storage | string | `50` | no |
| successful_requests_silenced | Groups to mute for Storage sucessful requests monitor | map | `<map>` | no |
| successful_requests_threshold_critical | Minimum acceptable percent of successful requests for a storage | string | `10` | no |
| successful_requests_threshold_warning | Warning regarding acceptable percent of successful requests for a storage | string | `30` | no |
| throttling_error_requests_silenced | Groups to mute for Storage throttling error monitor | map | `<map>` | no |
| throttling_error_requests_threshold_critical | Maximum acceptable percent of throttling error requests for a storage | string | `90` | no |
| throttling_error_requests_threshold_warning | Warning regarding acceptable percent of throttling error requests for a storage | string | `50` | no |
| timeout_error_requests_silenced | Groups to mute for Storage timeout monitor | map | `<map>` | no |
| timeout_error_requests_threshold_critical | Maximum acceptable percent of timeout error requests for a storage | string | `90` | no |
| timeout_error_requests_threshold_warning | Warning regarding acceptable percent of timeout error requests for a storage | string | `50` | no |

Related documentation
---------------------

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_storage/](https://docs.datadoghq.com/integrations/azure_storage/)

DataDog blog: [https://www.datadoghq.com/blog/monitor-azure-storage-datadog/](https://www.datadoghq.com/blog/monitor-azure-storage-datadog/)

Azure Storage metrics documentation: [https://docs.microsoft.com/en-us/azure/storage/common/storage-monitor-storage-account](https://docs.microsoft.com/en-us/azure/storage/common/storage-monitor-storage-account)

Azure Storage metrics detailed documentation [https://docs.microsoft.com/en-us/rest/api/storageservices/storage-analytics-metrics-table-schema](https://docs.microsoft.com/en-us/rest/api/storageservices/storage-analytics-metrics-table-schema)