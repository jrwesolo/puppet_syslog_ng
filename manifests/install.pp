# Install syslog-ng with basic logging
class syslog_ng::install {

  $manage_package = $::syslog_ng::manage_package
  $package        = $::syslog_ng::package
  $manage_legacy  = $::syslog_ng::manage_legacy
  $legacy_package = $::syslog_ng::legacy_package

  if $manage_package {
    # install syslog-ng
    package { $package:
      ensure  => present,
    }

    # generally used to remove rsyslog
    if $manage_legacy {
      package { $legacy_package:
        ensure  => absent,
      }
    }
  }

}
