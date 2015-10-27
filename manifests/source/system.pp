# syslog_ng default system source
define syslog_ng::source::system (
  $comment    = "native log messages and syslog-ng internal messages",
  $identifier = $title,
  $order      = undef,
) {

  syslog_ng::source { $title:
    comment    => $comment,
    identifier => $identifier,
    order      => $order,
    spec       => "system();\ninternal();",
  }

}
