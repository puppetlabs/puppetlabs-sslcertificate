define sslcertificate($name, $password, $location, $root_store = 'LocalMachine', $store_dir = 'My') {
  validate_re($name, ['^(.)+$'],"Must pass name to ${module_name}\[${title}\]")
  validate_re($password, ['^(.)+$'],"Must pass password to ${module_name}\[${title}\]")
  validate_re($location, ['^(.)+$'],"Must pass location to ${module_name}\[${title}\]")

  if ! defined(File['C:\temp']) {
    file { 'C:\temp':
      ensure => directory,
    }
  }

  file { "inspect-${name}-certificate.ps1" :
    ensure  => present,
    path    => "C:\\temp\\inspect-${name}.ps1",
    content => template('sslcert/inspect.ps1.erb'),
    require => File['C:\temp']
  }

  file { "import-${name}-certificate.ps1" :
    ensure  => present,
    path    => "C:\\temp\\import-${name}.ps1",
    content => template('sslcert/import.ps1.erb'),
    require => File['C:\temp']
  }

  exec { "Install SSL Cert":
    provider  => powershell,
    command   => "c:\\temp\\import-${name}.ps1",
    onlyif    => "c:\\temp\\inspect-${name}.ps1",
    logoutput => true,
    require   => File["inspect-${name}-certificate.ps1", "import-${name}-certificate.ps1"],
  }
}
