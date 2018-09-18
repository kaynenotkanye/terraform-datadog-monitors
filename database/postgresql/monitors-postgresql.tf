resource "datadog_monitor" "postgresql_connection_too_high" {
  count   = "${var.postgresql_connection_enabled ? 1 : 0}"
  name    = "[${var.environment}] PostgreSQL Connections {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = "${coalesce(var.postgresql_connection_message, var.message)}"
  type    = "metric alert"

  query = <<EOF
    ${var.postgresql_connection_time_aggregator}(${var.postgresql_connection_timeframe}):
      avg:postgresql.percent_usage_connections${module.filter-tags.query_alert} by {server}
    * 100 > ${var.postgresql_connection_threshold_critical}
  EOF

  evaluation_delay = "${var.evaluation_delay}"
  new_host_delay   = "${var.new_host_delay}"

  thresholds {
    warning  = "${var.postgresql_connection_threshold_warning}"
    critical = "${var.postgresql_connection_threshold_critical}"
  }

  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = true
  timeout_h           = 0
  include_tags        = true

  silenced = "${var.postgresql_connection_silenced}"

  tags = ["env:${var.environment}", "type:database", "provider:postgres", "resource:postgresql", "team:claranet", "created-by:terraform", "${var.postgresql_connection_extra_tags}"]
}

resource "datadog_monitor" "postgresql_too_many_locks" {
  count   = "${var.postgresql_lock_enabled ? 1 : 0}"
  name    = "[${var.environment}] PostgreSQL too many locks {{#is_alert}}{{{comparator}}} {{threshold}} ({{value}}){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}} ({{value}}){{/is_warning}}"
  message = "${coalesce(var.postgresql_lock_message, var.message)}"
  type    = "metric alert"

  query = <<EOF
    ${var.postgresql_lock_time_aggregator}(${var.postgresql_lock_timeframe}):
      default(avg:postgresql.locks${module.filter-tags.query_alert} by {server}, 0)
    > ${var.postgresql_lock_threshold_critical}
  EOF

  evaluation_delay = "${var.evaluation_delay}"
  new_host_delay   = "${var.new_host_delay}"

  thresholds {
    warning  = "${var.postgresql_lock_threshold_warning}"
    critical = "${var.postgresql_lock_threshold_critical}"
  }

  notify_no_data      = false
  renotify_interval   = 0
  require_full_window = true
  timeout_h           = 0
  include_tags        = true

  silenced = "${var.posgresql_lock_silenced}"

  tags = ["env:${var.environment}", "type:database", "provider:postgres", "resource:postgresql", "team:claranet", "created-by:terraform", "${var.postgresql_lock_extra_tags}"]
}
