#
# This class manages a syslog-ng server. It can be uses for standard logging or
# complex client/server setups
#
# === Parameters
#
# See README.md for a detailed parameter description
#
# === Variables
#
# No variables required. See params.pp for options.
#
# === Examples
#
# Basic setup:
#
#  import syslog_ng
#
# Some special logging
#
#  syslog_ng::destination::file {'d_file':
#    file => '/var/log/myapp.log'
#  }
#  syslog_ng::filter {'f_mypp':
#    spec => 'program(myapp_name)
#  }
#  syslog_ng::filter {'f_app_server':
#    spec => 'host(appserver.example.org)'
#  }
#  syslog_ng::log {'l_my_app':
#    source      => 's_src',
#    filter      => ['f_myapp', 'f_app_server'],
#    destination => 'd_file'
#  }
#
# === Authors
#
# Sören Berger <soeren.berger@u1337.de>
#
# === Copyright
#
# Copyright 2015 Sören Berger.
#

class syslog_ng (
  $config_dir      = $::syslog_ng::params::config_dir,
  $local_source    = $::syslog_ng::params::local_source,
  $reminder_file   = $::syslog_ng::params::reminder_file,
  $config_version  = $::syslog_ng::params::config_version,
  $create_tty10    = $::syslog_ng::params::create_tty10,
  $tty10_path      = $::syslog_ng::params::tty10_path,
  $create_dirs     = $::syslog_ng::params::create_dirs,
  $manage_service  = $::syslog_ng::params::manage_service,
  $service_ensure  = $::syslog_ng::params::service_ensure,
  $service_enable  = $::syslog_ng::params::service_enable,
  $service         = $::syslog_ng::params::service,
  $owner           = $::syslog_ng::params::owner,
  $group           = $::syslog_ng::params::group,
  $keep_hostname   = $::syslog_ng::params::keep_hostname,
  $perm            = $::syslog_ng::params::perm,
  $dir_owner       = $::syslog_ng::params::dir_owner,
  $dir_group       = $::syslog_ng::params::dir_group,
  $dir_perm        = $::syslog_ng::params::dir_perm,
  $use_fqdn        = $::syslog_ng::params::use_fqdn,
  $use_dns         = $::syslog_ng::params::use_dns,
  $chain_hostnames = $::syslog_ng::params::chain_hostnames,
  $stats_freq      = $::syslog_ng::params::stats_freq,
  $mark_freq       = $::syslog_ng::params::mark_freq,
  $threaded        = $::syslog_ng::params::threaded,
  $flush_lines     = $::syslog_ng::params::flush_lines,
  $log_fifo_size   = $::syslog_ng::params::log_fifo_size,
  $manage_package  = $::syslog_ng::params::manage_package,
  $package         = $::syslog_ng::params::package,
  $manage_legacy   = $::syslog_ng::params::manage_legacy,
  $legacy_package  = $::syslog_ng::params::legacy_package,
  $config_file_source      = $::syslog_ng::params::config_file_source,
  $config_file_destination = $::syslog_ng::params::config_file_destination,
  $config_file_filter      = $::syslog_ng::params::config_file_filter,
  $config_file_parser      = $::syslog_ng::params::config_file_parser,
  $config_file_rewrite     = $::syslog_ng::params::config_file_rewrite,
  $config_file_logging     = $::syslog_ng::params::config_file_logging,
  $config_file_fallback    = $::syslog_ng::params::config_file_fallback,
) inherits ::syslog_ng::params {

  # construct variables after parameter resolution
  $conf_d_dir = "${::syslog_ng::config_dir}/conf.d"
  $config_path_source      = "${conf_d_dir}/${config_file_source}"
  $config_path_destination = "${conf_d_dir}/${config_file_destination}"
  $config_path_filter      = "${conf_d_dir}/${config_file_filter}"
  $config_path_parser      = "${conf_d_dir}/${config_file_parser}"
  $config_path_rewrite     = "${conf_d_dir}/${config_file_rewrite}"
  $config_path_logging     = "${conf_d_dir}/${config_file_logging}"
  $config_path_fallback    = "${conf_d_dir}/${config_file_fallback}"

  class { '::syslog_ng::install': } ->
  class { '::syslog_ng::config': } ~>
  class { '::syslog_ng::service': } ->
  Class['::syslog_ng']

}
