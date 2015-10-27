# manage syslog-ng service
class syslog_ng::service {

  if $::syslog_ng::manage_service {
    service { $::syslog_ng::service:
      ensure     => $::syslog_ng::service_ensure,
      enable     => $::syslog_ng::service_enable,
      hasstatus  => true,
      hasrestart => true,
    }
  }

}
