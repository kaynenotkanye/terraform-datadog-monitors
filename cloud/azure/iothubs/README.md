Azure IOT Hubs DataDog monitors
===============================

How to use this module
----------------------

```
module "iothubs" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//cloud/azure/iothubs?ref=MON-80-azure-hub-iot-monitors"
  
  message     = "${module.datadog-message-alerting.alerting-message}"
  environment = "${var.environment}"
}
```

Purpose
-------
Creates a DataDog monitors with the following checks :

* Service status check
* Jobs failed average check
* Query Jobs failed average check
* List Jobs failed average check
* Total devices count check
* C2D methods failed average check
* C2D twin read failed average check
* C2D twin update failed average check
* D2C twin read failed average check
* D2C twin update failed average check
* D2C telemetry egress dropped count check
* D2C telemetry egress orphaned count check
* D2C telemetry egress invalid count check
* D2C telemetry egress fallback count check
* D2C telemetry ingress no sent count check

Inputs
------

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| delay | Delay in seconds for the metric evaluation | string | `600` | no |
| dropped_d2c_telemetry_egress_silenced | Groups to mute for IoT Hub dropped d2c telemetry monitor | map | `<map>` | no |
| dropped_d2c_telemetry_egress_threshold_critical | D2C Telemetry Dropped limit (critical threshold) | string | `1000` | no |
| dropped_d2c_telemetry_egress_threshold_warning | D2C Telemetry Dropped limit (warning threshold) | string | `500` | no |
| environment | Architecture Environment | string | - | yes |
| failed_c2d_methods_rate_silenced | Groups to mute for IoT Hub failed c2d methods monitor | map | `<map>` | no |
| failed_c2d_methods_rate_threshold_critical | C2D Methods Failed rate limit (critical threshold) | string | `90` | no |
| failed_c2d_methods_rate_threshold_warning | C2D Methods Failed rate limit (warning threshold) | string | `50` | no |
| failed_c2d_twin_read_rate_silenced | Groups to mute for IoT Hub failed c2d twin read monitor | map | `<map>` | no |
| failed_c2d_twin_read_rate_threshold_critical | C2D Twin Read Failed rate limit (critical threshold) | string | `90` | no |
| failed_c2d_twin_read_rate_threshold_warning | C2D Twin Read Failed rate limit (warning threshold) | string | `50` | no |
| failed_c2d_twin_update_rate_silenced | Groups to mute for IoT Hub failed c2d twin update monitor | map | `<map>` | no |
| failed_c2d_twin_update_rate_threshold_critical | C2D Twin Update Failed rate limit (critical threshold) | string | `90` | no |
| failed_c2d_twin_update_rate_threshold_warning | C2D Twin Update Failed rate limit (warning threshold) | string | `50` | no |
| failed_d2c_twin_read_rate_silenced | Groups to mute for IoT Hub failed d2c twin read monitor | map | `<map>` | no |
| failed_d2c_twin_read_rate_threshold_critical | D2C Twin Read Failed rate limit (critical threshold) | string | `90` | no |
| failed_d2c_twin_read_rate_threshold_warning | D2C Twin Read Failed rate limit (warning threshold) | string | `50` | no |
| failed_d2c_twin_update_rate_silenced | Groups to mute for IoT Hub failed d2c twin update monitor | map | `<map>` | no |
| failed_d2c_twin_update_rate_threshold_critical | D2C Twin Update Failed rate limit (critical threshold) | string | `90` | no |
| failed_d2c_twin_update_rate_threshold_warning | D2C Twin Update Failed rate limit (warning threshold) | string | `50` | no |
| failed_jobs_rate_silenced | Groups to mute for IoT Hub failed jobs monitor | map | `<map>` | no |
| failed_jobs_rate_threshold_critical | Jobs Failed rate limit (critical threshold) | string | `90` | no |
| failed_jobs_rate_threshold_warning | Jobs Failed rate limit (warning threshold) | string | `50` | no |
| failed_listjobs_rate_silenced | Groups to mute for IoT Hub failed list jobs monitor | map | `<map>` | no |
| failed_listjobs_rate_threshold_critical | ListJobs Failed rate limit (critical threshold) | string | `90` | no |
| failed_listjobs_rate_threshold_warning | ListJobs Failed rate limit (warning threshold) | string | `50` | no |
| failed_queryjobs_rate_silenced | Groups to mute for IoT Hub failed query jobs monitor | map | `<map>` | no |
| failed_queryjobs_rate_threshold_critical | QueryJobs Failed rate limit (critical threshold) | string | `90` | no |
| failed_queryjobs_rate_threshold_warning | QueryJobs Failed rate limit (warning threshold) | string | `50` | no |
| fallback_d2c_telemetry_egress_silenced | Groups to mute for IoT Hub fallback d2c telemetry monitor | map | `<map>` | no |
| fallback_d2c_telemetry_egress_threshold_critical | D2C Telemetry Fallback limit (critical threshold) | string | `1000` | no |
| fallback_d2c_telemetry_egress_threshold_warning | D2C Telemetry Fallback limit (warning threshold) | string | `500` | no |
| filter_tags | Tags used for filtering | string | `*` | no |
| invalid_d2c_telemetry_egress_silenced | Groups to mute for IoT Hub invalid d2c telemetry monitor | map | `<map>` | no |
| invalid_d2c_telemetry_egress_threshold_critical | D2C Telemetry Invalid limit (critical threshold) | string | `1000` | no |
| invalid_d2c_telemetry_egress_threshold_warning | D2C Telemetry Invalid limit (warning threshold) | string | `500` | no |
| message | Message sent when an alert is triggered | string | - | yes |
| orphaned_d2c_telemetry_egress_silenced | Groups to mute for IoT Hub orphaned d2c telemetry monitor | map | `<map>` | no |
| orphaned_d2c_telemetry_egress_threshold_critical | D2C Telemetry Orphaned limit (critical threshold) | string | `1000` | no |
| orphaned_d2c_telemetry_egress_threshold_warning | D2C Telemetry Orphaned limit (warning threshold) | string | `500` | no |
| status_silenced | Groups to mute for IoT Hub status monitor | map | `<map>` | no |
| too_many_d2c_telemetry_ingress_nosent_silenced | Groups to mute for IoT Hub unsent d2c telemetry monitor | map | `<map>` | no |
| total_devices_silenced | Groups to mute for IoT Hub total device monitor | map | `<map>` | no |

Related documentation
---------------------

DataDog documentation: [https://docs.datadoghq.com/integrations/azure_iot_hub](https://docs.datadoghq.com/integrations/azure_iot_hub)

Azure IOT Hubs metrics documentation: [https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-monitor-resource-health](https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-monitor-resource-health)