# syslog network destination
define syslog_ng::destination::network (
  $address         = undef,
  $comment         = undef,
  $flags           = undef,
  $flush_lines     = undef,
  $identifier      = $title,
  $ip_protocol     = undef,
  $localip         = undef,
  $localport       = undef,
  $log_fifo_size   = undef,
  $network         = undef,
  $order           = undef,
  $port            = undef,
  $suppress        = undef,
  $template        = undef,
  $template_escape = undef,
  $time_zone       = undef,
  $transport       = undef,
) {

  syslog_ng::destination { $title:
    spec       => template('syslog_ng/destination/network.erb'),
    identifier => $identifier,
    comment    => $comment,
    order      => $order,
  }

}

