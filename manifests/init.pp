#
define sslcertificate($name, $password, $location, $thumbprint, $root_store = 'LocalMachine', $store_dir = 'My') {
  validate_re($name, ['^(.)+$'],"Must pass name to ${module_name}\[${title}\]")
  validate_re($location, ['^(.)+$'],"Must pass location to ${module_name}\[${title}\]")
  validate_re($thumbprint, ['^(.)+$'], "Must pass a certificate thumbprint to ${module_name}\[${title}\]")

  if ! defined(File['C:\temp']) {
    file { 'C:\temp':
      ensure => directory,
    }
  }

  file { "inspect-${name}-certificate.ps1" :
    ensure  => present,
    path    => "C:\\temp\\inspect-${name}.ps1",
    content => template('sslcertificate/inspect.ps1.erb'),
    require => File['C:\temp']
  }

  file { "import-${name}-certificate.ps1" :
    ensure  => present,
    path    => "C:\\temp\\import-${name}.ps1",
    content => template('sslcertificate/import.ps1.erb'),
    require => File['C:\temp']
  }

  exec { "Install-${name}-SSLCert":
    provider  => powershell,
    command   => "c:\\temp\\import-${name}.ps1",
    onlyif    => "c:\\temp\\inspect-${name}.ps1",
    logoutput => true,
    require   => [File["inspect-${name}-certificate.ps1"], File["import-${name}-certificate.ps1"]],
  }
}
