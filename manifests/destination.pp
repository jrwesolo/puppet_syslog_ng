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

# # syslog network destination
# define syslog_ng::destination::network (
#   $log_server = undef,
#   $log_port   = undef,
#   $proto      = 'udp',
#   ) {
#   case $proto {
#     'UDP', 'udp': {
#       syslog_ng::destination {$title:
#         spec   => "udp('${log_server}' port(${log_port}) log_fifo_size(${::syslog_ng::log_fifo_size_destination}));",
#         target => $syslog_ng::params::config_file_destination_remote
#       }
#     }
#     'TCP', 'tcp': {
#       syslog_ng::destination {$title:
#         spec   => "tcp('${log_server}' port(${log_port}) log_fifo_size(${::syslog_ng::log_fifo_size_destination}));",
#         target => $syslog_ng::params::config_file_destination_remote
#       }
#     }
#     default: {
#       fail("${proto} is not supported by syslog_ng::client")
#     }
#   }
# }
