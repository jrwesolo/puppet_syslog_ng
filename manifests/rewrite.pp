# Generic syslog_ng rewrite
define syslog_ng::rewrite (
  $comment    = undef,
  $identifier = $title,
  $order      = undef,
  $spec       = undef,
) {

  $entry_type = 'rewrite'

  concat::fragment { "${entry_type}_${title}":
    target  => $::syslog_ng::config_file_rewrite,
    content => template('syslog_ng/entry.erb'),
    order   => $order,
  }

}
