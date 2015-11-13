# syslog network source
define syslog_ng::source::network (
  $comment          = undef,
  $flags            = undef,
  $host_override    = undef,
  $identifier       = $title,
  $ip_protocol      = undef,
  $keep_hostname    = undef,
  $keep_timestamp   = undef,
  $localip          = undef,
  $localport        = undef,
  $max_connections  = undef,
  $order            = undef,
  $program_override = undef,
  $tags             = undef,
  $time_zone        = undef,
  $transport        = undef,
) {

  if versioncmp($::syslog_ng::config_version, '3.4') < 0 {
    $source_template = 'syslog_ng/source/legacy_network.erb'
  }
  else {
    $source_template = 'syslog_ng/source/network.erb'
  }

  syslog_ng::source { $title:
    spec       => template($source_template),
    identifier => $identifier,
    comment    => $comment,
    order      => $order,
  }

}

