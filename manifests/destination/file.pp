# syslog file destination
define syslog_ng::destination::file (
  $comment         = undef,
  $create_dirs     = undef,
  $dir_group       = undef,
  $dir_owner       = undef,
  $dir_perm        = undef,
  $file            = undef,
  $flags           = undef,
  $flush_lines     = undef,
  $group           = undef,
  $identifier      = $title,
  $log_fifo_size   = undef,
  $order           = undef,
  $owner           = undef,
  $perm            = undef,
  $suppress        = undef,
  $template        = undef,
  $template_escape = undef,
) {

  syslog_ng::destination { $title:
    spec       => template('syslog_ng/destination/file.erb'),
    identifier => $identifier,
    comment    => $comment,
    order      => $order,
  }

}

