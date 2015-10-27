# Generic syslog_ng parser
define syslog_ng::parser (
  $comment    = undef,
  $identifier = $title,
  $order      = undef,
  $spec       = undef,
) {

  $entry_type = 'parser'

  concat::fragment { "${entry_type}_${title}":
    target  => $::syslog_ng::config_file_parser,
    content => template('syslog_ng/entry.erb')
    order   => $order,
  }

}
