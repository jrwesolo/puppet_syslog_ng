# syslog_ng unix-stream source
define syslog_ng::source::unix_stream (
  $comment          = undef,
  $encoding         = undef,
  $file             = undef,
  $flags            = undef,
  $group            = undef,
  $host_override    = undef,
  $identifier       = $title,
  $keep_timestamp   = undef,
  $max_connections  = undef,
  $order            = undef,
  $owner            = undef,
  $perm             = undef,
  $program_override = undef,
  $tags             = undef,
  $time_zone        = undef,
) {

  syslog_ng::source { $title:
    spec       => template('syslog_ng/source/unix_stream.erb'),
    identifier => $identifier,
    comment    => $comment,
    order      => $order,
  }

}
