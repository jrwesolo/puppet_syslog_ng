# Generic syslog_ng log
define syslog_ng::log (
  $source       = $::syslog_ng::local_source,
  $comment      = undef,
  $filter       = undef,
  $filter_spec  = undef,
  $order        = undef,
  $parser       = undef,
  $parser_spec  = undef,
  $rewrite      = undef,
  $rewrite_spec = undef,
  $destination  = undef,
  $file         = undef,
  $network      = undef,
  $flags        = undef,
) {

  $target = $flags ? {
    /(?:^|,)fallback(?:$|,)/ => $::syslog_ng::config_path_fallback,
    default                  => $::syslog_ng::config_path_logging,
  }

  if $filter_spec {
    syslog_ng::filter { "f_${title}":
      spec => $filter_spec,
    }
  }

  if $parser_spec {
    syslog_ng::parser { "p_${title}":
      spec => $parser_spec,
    }
  }

  if $rewrite_spec {
    syslog_ng::rewrite { "r_${title}":
      spec => $rewrite_spec,
    }
  }

  if $file {
    syslog_ng::destination::file { "d_file_${title}":
      file => $file,
    }
  }

  if $network {
    syslog_ng::destination::network { "d_net_${title}":
      network => $network,
    }
  }

  concat::fragment { "log_${title}":
    target  => $target,
    content => template('syslog_ng/log.erb'),
    order   => $order,
  }

}
