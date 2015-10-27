class syslog_ng::config {

  # variables for template scope
  $chain_hostnames = $::syslog_ng::chain_hostnames
  $conf_d_dir      = $::syslog_ng::conf_d_dir
  $config_version  = $::syslog_ng::config_version
  $create_dirs     = $::syslog_ng::create_dirs
  $create_tty10    = $::syslog_ng::create_tty10
  $dir_owner       = $::syslog_ng::dir_owner
  $dir_group       = $::syslog_ng::dir_group
  $dir_perm        = $::syslog_ng::dir_perm
  $flush_lines     = $::syslog_ng::flush_lines
  $group           = $::syslog_ng::group
  $keep_hostname   = $::syslog_ng::keep_hostname
  $log_fifo_size   = $::syslog_ng::log_fifo_size
  $mark_freq       = $::syslog_ng::mark_freq
  $owner           = $::syslog_ng::owner
  $perm            = $::syslog_ng::perm
  $stats_freq      = $::syslog_ng::stats_freq
  $threaded        = $::syslog_ng::threaded
  $tty10_path      = $::syslog_ng::tty10_path
  $use_dns         = $::syslog_ng::use_dns
  $use_fqdn        = $::syslog_ng::use_fqdn

  file { $::syslog_ng::config_dir:
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    recurse => true,
    purge   => true,
    force   => true,
  }

  file { "${::syslog_ng::config_dir}/scl.conf":
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => file('syslog_ng/scl.conf'),
  }

  if $::syslog_ng::create_tty10 {
    file { "${::syslog_ng::config_dir}/tty10.conf":
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template('syslog_ng/tty10.conf.erb'),
    }
  }

  file { "${::syslog_ng::config_dir}/syslog-ng.conf":
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('syslog_ng/syslog-ng.conf.erb'),
  }

  file { $::syslog_ng::conf_d_dir:
    ensure  => directory,
    recurse => true,
    purge   => true,
  }

  include syslog_ng::config::fragments

  # Default source
  syslog_ng::source::system { $::syslog_ng::local_source: }

}
