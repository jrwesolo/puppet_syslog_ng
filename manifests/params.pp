class syslog_ng::params {

  # package/service settings
  $config_dir     = '/etc/syslog-ng'
  $manage_package = true
  $package        = 'syslog-ng'
  $manage_legacy  = true
  $legacy_package = 'rsyslog'
  $manage_service = true
  $service_ensure = true
  $service_enable = true
  $service        = 'syslog-ng'

  # the packaged tty10.conf seems to only exist on Ubuntu 14.04 and Debian 8
  # we need this so we can create the file ourselves
  $create_tty10 = true
  $tty10_path   = '/dev/tty10'

  # identifier for default internal/system source
  $local_source   = 's_src'

  # Global permissions
  $chain_hostnames = false  # enable or disable the chained hostname format
  $create_dirs     = true   # enable or disable directory creation for destination files
  $dir_owner       = 'root' # default owner of newly created directories
  $dir_group       = 'root' # default group of newly created directories
  $dir_perm        = '0700' # default permission of newly created directories
  $flush_lines     = 0      # specifies how many lines are flushed to a destination at a time
  $group           = 'root' # default group of output files
  $keep_hostname   = false  # enable or disable hostname rewriting
  $log_fifo_size   = 10000  # the number of messages that the output queue can store
  $mark_freq       = 0      # The number of seconds between two MARK messages, 0 = disabled
  $owner           = 'root' # default owner of output files
  $perm            = '0600' # default permission of output files
  $stats_freq      = 0      # the period between two STATS messages in seconds, 0 = disabled
  $use_dns         = true   # enable or disable DNS usage
  $use_fqdn        = false  # add FQDN instead of short hostname

  # Platform-specific options
  # $threaded # This is not available on CentOS 6 using syslog-ng 3.2.5
  $threaded = undef # setting this to undef for now so user has to pass value

  # Config file fragments
  $config_file_source      = "10_source.conf"
  $config_file_destination = "20_destination.conf"
  $config_file_filter      = "30_filter.conf"
  $config_file_parser      = "40_parser.conf"
  $config_file_rewrite     = "50_rewrite.conf"
  $config_file_logging     = "90_logging.conf"
  $config_file_fallback    = "99_fallback.conf"

  # set config_version based on operating system and version
  case $::operatingsystem {
    'RedHat', 'CentOS': {
      case $::operatingsystemrelease {
        /^6\./: {
          $config_version = '3.2'
        }
        /^7\./: {
          $config_version = '3.5'
        }
        default: {
          $config_version = '3.5' # fallback
        }
      }
    }
    'Debian': {
      case $::operatingsystemrelease {
        /^7\./: {
          $config_version = '3.3'
        }
        /^8\./: {
          $config_version = '3.5'
        }
        default: {
          $config_version = '3.5' # fallback
        }
      }
    }
    'Ubuntu': {
      case $::operatingsystemrelease {
        /^12\./: {
          $config_version = '3.3'
        }
        /^14\./: {
          $config_version = '3.5'
        }
        default: {
          $config_version = '3.5' # fallback
        }
      }
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }

}
