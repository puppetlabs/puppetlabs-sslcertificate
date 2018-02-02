# Author::    Paul Stack (mailto:pstack@opentable.com)
# Copyright:: Copyright (c) 2013 OpenTable Inc
# License::   MIT
# == Define: sslcertificate
#
# This defined type will install SSL Certs on windows
#
# === Requirements/Dependencies
#
# Currently reequires the puppetlabs/stdlib module on the Puppet Forge in
# order to validate much of the the provided configuration.
#
# === Parameters
#
# [*password*]
# The password for the given certificate
# By default is undef
#
# [*location*]
# The location to store intermediate certificates.
# Do not end the string with any forward or backslash.
#
# [*thumbprint*]
# The thumbprint used to verify the certificate
#
# [*store_dir*]
# The certificate store where the certificate will be installed to
#
# [*root_store*]
# The store location for the given certification store. Either LocalMachine or CurrentUser
#
# [*scripts_dir*]
# This parameter has been deprecated and is no longer used.
#
# [*is_exportable*]
# Flag to set the key as exportable. true == exportable; false == not exportable.
# By default is set to true.
# === Examples
#
# To install a certificate in the My directory of the LocalMachine root store:
#
#  sslcertificate { "Install-PFX-Certificate" :
#    name       => 'mycert.pfx',
#    password   => 'password123',
#    location   => 'C:',
#    thumbprint => '07E5C1AF7F5223CB975CC29B5455642F5570798B'
#  }
#
# To install a certifcate in an alternative directory:
#
#  sslcertificate { "Install-Intermediate-Certificate" :
#    name       => 'go_daddy_intermediate.p7b',
#    location   => 'C:',
#    store_dir  => 'CA',
#    root_store => 'LocalMachine',
#    thumbprint => '07E5C1AF7F5223CB975CC29B5455642F5570798B'
#  }
#
# To install a certificate in the My directory of the LocalMachine root store
# and set the key as not exportable:
#
#  sslcertificate { "Install-PFX-Certificate" :
#    name           => 'mycert.pfx',
#    password       => 'password123',
#    location       => 'C:',
#    thumbprint     => '07E5C1AF7F5223CB975CC29B5455642F5570798B',
#    exportable  => false
#  }
#
define sslcertificate (
  String[1] $location,
  String[1] $thumbprint,
  Optional[String[1]] $password    = undef,
  String[1] $root_store            = 'LocalMachine',
  String[1] $store_dir             = 'My',
  Stdlib::Windowspath $scripts_dir = 'C:\temp',
  Boolean $exportable              = true
) {

  if $exportable {
    $key_storage_flags = 'Exportable,PersistKeySet'
  } else {
    $key_storage_flags = 'PersistKeySet'
  }

  exec { "Install-${name}-SSLCert":
    provider  => powershell,
    command   => template('sslcertificate/import.ps1.erb'),
    onlyif    => template('sslcertificate/inspect.ps1.erb'),
    logoutput => true,
  }
}
