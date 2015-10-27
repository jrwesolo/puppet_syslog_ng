# Generic syslog_ng source
define syslog_ng::source (
  $comment    = undef,
  $identifier = $title,
  $order      = undef,
  $spec       = undef,
) {

  $entry_type = 'source'

  concat::fragment { "${entry_type}_${title}":
    target  => $::syslog_ng::config_path_source,
    content => template('syslog_ng/entry.erb'),
    order   => $order,
  }

}

# # syslog-ng network source
# define syslog_ng::source::network(
#   $ip       = undef,
#   $port     = undef,
#   $proto    = 'udp',
#   $fallback = undef,
#   ) {
#   case $proto {
#     'UDP', 'udp': {
#       syslog_ng::source { $title:
#         spec     => "udp(ip('${ip}') port(${port}));",
#         fallback => $fallback
#       }
#     }
#     'TCP', 'tcp': {
#       syslog_ng::source { $title:
#         spec     => "tcp(ip('${ip}') port(${port}));",
#         fallback => $fallback
#       }
#     }
#     'ALL', 'all': {
#       syslog_ng::source { $title:
#         spec     => "\n  tcp(ip('${ip}') port(${port}));\n  udp(ip('${ip}') port(${port}));\n",
#         fallback => $fallback
#       }
#     }
#     default: {
#       fail("${proto} is not supported by syslog_ng::server")
#     }
#   }
# }

