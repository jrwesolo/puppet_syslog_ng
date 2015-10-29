# Generic syslog destination
define syslog_ng::destination (
  $comment    = undef,
  $identifier = $title,
  $order      = undef,
  $spec       = undef,
) {

  $entry_type = 'destination'

  concat::fragment { "${entry_type}_${title}":
    target  => $::syslog_ng::config_path_destination,
    content => template('syslog_ng/entry.erb'),
    order   => $order,
  }

}
