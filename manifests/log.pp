# Generic syslog_ng log
define syslog_ng::log (
  $source        = $::syslog_ng::local_source,
  $comment       = undef,
  $filter        = undef,
  $filter_spec   = undef,
  $order         = undef,
  $parser        = undef,
  $parser_spec   = undef,
  $rewrite       = undef,
  $rewrite_spec  = undef,
  $destination   = undef,
  $file          = undef,
  $file_template = undef,
  $network       = undef,
  $syslog        = undef,
  $pipe          = undef,
  $flags         = undef,
) {

  $target = $flags ? {
    /(?:^|,)fallback(?:$|,)/ => $::syslog_ng::config_path_fallback,
    default                  => $::syslog_ng::config_path_logging,
  }

  if $filter_spec {
    syslog_ng::filter { "f_${title}":
      comment => $comment,
      spec    => $filter_spec,
    }
  }

  if $parser_spec {
    syslog_ng::parser { "p_${title}":
      comment => $comment,
      spec    => $parser_spec,
    }
  }

  if $rewrite_spec {
    syslog_ng::rewrite { "r_${title}":
      comment => $comment,
      spec    => $rewrite_spec,
    }
  }

  if $file {
    syslog_ng::destination::file { "d_file_${title}":
      comment  => $comment,
      file     => $file,
      template => $file_template,
    }
  }

  if $network {
    syslog_ng::destination::network { "d_net_${title}":
      comment => $comment,
      host    => $network,
    }
  }

  if $syslog {
    syslog_ng::destination::syslog { "d_syslog_${title}":
      comment => $comment,
      host    => $syslog,
    }
  }

  if $pipe {
    syslog_ng::destination::pipe { "d_pipe_${title}":
      comment => $comment,
      pipe    => $pipe,
    }
  }

  concat::fragment { "log_${title}":
    target  => $target,
    content => template('syslog_ng/log.erb'),
    order   => $order,
  }

}
