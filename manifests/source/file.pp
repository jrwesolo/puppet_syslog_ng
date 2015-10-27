# syslog_ng file source
define syslog_ng::source::file (
  $comment          = undef,
  $default_facility = undef,
  $default_priority = undef,
  $encoding         = undef,
  $file             = undef,
  $flags            = undef,
  $follow_freq      = undef,
  $identifier       = $title,
  $keep_timestamp   = undef,
  $order            = undef,
  $tags             = undef,
  $time_zone        = undef,
) {

  syslog_ng::source { $title:
    spec       => template('syslog_ng/source/file.erb'),
    identifier => $identifier,
    comment    => $comment,
    order      => $order,
  }

}
