# Generic syslog_ng filter
define syslog_ng::filter (
  $comment    = undef,
  $identifier = $title,
  $order      = undef,
  $spec       = undef,
) {

  $entry_type = 'filter'

  concat::fragment { "${entry_type}_${title}":
    target  => $::syslog_ng::config_path_filter,
    content => template('syslog_ng/entry.erb'),
    order   => $order,
  }

}
