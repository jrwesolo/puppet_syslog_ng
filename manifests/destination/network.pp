# syslog network destination
define syslog_ng::destination::network (
  $host            = undef,
  $comment         = undef,
  $flags           = undef,
  $flush_lines     = undef,
  $identifier      = $title,
  $ip_protocol     = undef,
  $localip         = undef,
  $localport       = undef,
  $log_fifo_size   = undef,
  $order           = undef,
  $port            = undef,
  $suppress        = undef,
  $template        = undef,
  $template_escape = undef,
  $time_zone       = undef,
  $transport       = undef,
) {

  if versioncmp($::syslog_ng::config_version, '3.4') < 0 {
    $destination_template = 'syslog_ng/destination/legacy_network.erb'
  }
  else {
    $destination_template = 'syslog_ng/destination/network.erb'
  }

  $parsed_host = syslog_parse_host($host)

  syslog_ng::destination { $title:
    spec       => template($destination_template),
    identifier => $identifier,
    comment    => $comment,
    order      => $order,
  }

}

