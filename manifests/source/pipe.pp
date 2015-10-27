# syslog_ng pipe source
define syslog_ng::source::pipe (
  $comment          = undef,
  $flags            = undef,
  $follow_freq      = undef,
  $identifier       = $title,
  $keep_timestamp   = undef,
  $order            = undef,
  $pipe             = undef,
  $program_override = undef,
  $tags             = undef,
  $time_zone        = undef,
) {

  syslog_ng::source { $title:
    spec       => template('syslog_ng/source/pipe.erb'),
    identifier => $identifier,
    comment    => $comment,
    order      => $order,
  }

}
