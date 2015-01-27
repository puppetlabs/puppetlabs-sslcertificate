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
# The password for the given certifcate
#
# [*location*]
# The location to store intermediate certificates
#
# [*thumbprint*]
# The thumbprint used to verify the certifcate
#
# [*store_dir*]
# The certifcate store where the certifcate will be installed to
#
# [*root_store*]
# The store location for the given certifcation store. Either LocalMachine or CurrentUser
#
# === Examples
#
# To install a certificate in the My directory of the LocalMachine root store:
#
#  sslcertificate { "Install-PFX-Certificate" :
#    name       => 'mycert.pfx',
#    password   => 'password123',
#    location   => 'C:\',
#    thumbprint => '07E5C1AF7F5223CB975CC29B5455642F5570798B'
#  }
#
# To install a certifcate in an alterntative direcotory:
#
#  sslcertificate { "Install-Intermediate-Certificate" :
#    name       => 'go_daddy_intermediate.p7b',
#    location   => 'C:\',
#    store_dir  => 'CA',
#    root_store => 'LocalMachine',
#    thumbprint => '07E5C1AF7F5223CB975CC29B5455642F5570798B'
#  }
#
define sslcertificate($password, $location, $thumbprint, $root_store = 'LocalMachine', $store_dir = 'My') {
  validate_re($name, '^(.)+$',"Must pass name to ${module_name}[${title}]")
  validate_re($location, '^(.)+$',"Must pass location to ${module_name}[${title}]")
  validate_re($thumbprint, '^(.)+$', "Must pass a certificate thumbprint to ${module_name}[${title}]")

  exec { "Install-${name}-SSLCert":
    provider  => powershell,
    command   => template("sslcertificate/import.ps1.erb"),
    onlyif    => template("sslcertificate/inspect.ps1.erb"),
    logoutput => true,
  }
}
