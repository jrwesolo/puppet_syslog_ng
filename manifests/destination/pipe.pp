# syslog pipe destination
define syslog_ng::destination::pipe (
  $comment         = undef,
  $flags           = undef,
  $flush_lines     = undef,
  $group           = undef,
  $identifier      = $title,
  $log_fifo_size   = undef,
  $order           = undef,
  $owner           = undef,
  $perm            = undef,
  $pipe            = undef,
  $suppress        = undef,
  $template        = undef,
  $template_escape = undef,
) {

  syslog_ng::destination { $title:
    spec       => template('syslog_ng/destination/pipe.erb'),
    identifier => $identifier,
    comment    => $comment,
    order      => $order,
  }

}

