data "template_file" "filter" {
  template = "$${filter}"

  vars {
    filter = "${var.filter_tags_use_defaults == "true" ? format("dd_monitoring:enabled,dd_aws_elb:enabled,env:%s", var.environment) : "${var.filter_tags_custom}"}"
  }
}

resource "datadog_monitor" "ELB_no_healthy_instances" {
  name    = "[${var.environment}] ELB no healthy instances"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m): (
      avg:aws.elb.healthy_host_count{${data.template_file.filter.rendered}} by {region,loadbalancername}
    ) < 1
  EOF

  type = "metric alert"

  notify_no_data      = true
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.evaluation_delay}"
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:elb", "team:aws", "provider:aws"]
}

resource "datadog_monitor" "ELB_too_much_4xx" {
  name    = "[${var.environment}] ELB 4xx errors too high {{#is_alert}}{{comparator}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{comparator}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m): (
      avg:aws.elb.httpcode_elb_4xx{${data.template_file.filter.rendered}} by {region,loadbalancername} /
      avg:aws.elb.request_count{${data.template_file.filter.rendered}} by {region,loadbalancername}
    ) * 100 > ${var.elb_4xx_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.elb_4xx_threshold_warning}"
    critical = "${var.elb_4xx_threshold_critical}"
  }

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.evaluation_delay}"
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:elb", "team:aws", "provider:aws"]
}

resource "datadog_monitor" "ELB_too_much_5xx" {
  name    = "[${var.environment}] ELB 5xx errors too high {{#is_alert}}{{comparator}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{comparator}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m): (
      avg:aws.elb.httpcode_elb_5xx{${data.template_file.filter.rendered}} by {region,loadbalancername} /
      avg:aws.elb.request_count{${data.template_file.filter.rendered}} by {region,loadbalancername}
    ) * 100 > ${var.elb_5xx_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.elb_5xx_threshold_warning}"
    critical = "${var.elb_5xx_threshold_critical}"
  }

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.evaluation_delay}"
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:elb", "team:aws", "provider:aws"]
}

resource "datadog_monitor" "ELB_too_much_4xx_backend" {
  name    = "[${var.environment}] ELB backend 4xx errors too high {{#is_alert}}{{comparator}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{comparator}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m): (
      avg:aws.elb.httpcode_backend_4xx{${data.template_file.filter.rendered}} by {region,loadbalancername} /
      avg:aws.elb.request_count{${data.template_file.filter.rendered}} by {region,loadbalancername}
    ) * 100 > ${var.elb_backend_4xx_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.elb_backend_4xx_threshold_warning}"
    critical = "${var.elb_backend_4xx_threshold_critical}"
  }

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.evaluation_delay}"
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:elb", "team:aws", "provider:aws"]
}

resource "datadog_monitor" "ELB_too_much_5xx_backend" {
  name    = "[${var.environment}] ELB backend 5xx errors too high {{#is_alert}}{{comparator}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{comparator}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${var.message}"

  query = <<EOF
    avg(last_5m): (
      avg:aws.elb.httpcode_backend_5xx{${data.template_file.filter.rendered}} by {region,loadbalancername} /
      avg:aws.elb.request_count{${data.template_file.filter.rendered}} by {region,loadbalancername}
    ) * 100 > ${var.elb_backend_5xx_threshold_critical}
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.elb_backend_5xx_threshold_warning}"
    critical = "${var.elb_backend_5xx_threshold_critical}"
  }

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.evaluation_delay}"
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:elb", "team:aws", "provider:aws"]
}

resource "datadog_monitor" "ELB_backend_latency" {
  name    = "[${var.environment}] ELB latency too high {{#is_alert}}{{comparator}} {{threshold}}s ({{value}}s){{/is_alert}}{{#is_warning}}{{comparator}} {{warn_threshold}}s ({{value}}s){{/is_warning}}"
  message = "${var.message}"

  query = <<EOF
    min(last_5m): (
      avg:aws.elb.latency{${data.template_file.filter.rendered}} by {region,loadbalancername}
    ) > ${var.elb_backend_latency_critical}
  EOF

  type = "metric alert"

  thresholds {
    warning  = "${var.elb_backend_latency_warning}"
    critical = "${var.elb_backend_latency_critical}"
  }

  notify_no_data      = false
  evaluation_delay    = "${var.evaluation_delay}"
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = false
  new_host_delay      = "${var.evaluation_delay}"
  no_data_timeframe   = 20

  tags = ["env:${var.environment}", "resource:elb", "team:aws", "provider:aws"]
}
