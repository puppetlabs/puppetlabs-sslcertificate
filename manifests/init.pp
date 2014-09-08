#
define sslcertificate($name, $password, $location, $thumbprint, $root_store = 'LocalMachine', $store_dir = 'My') {
  validate_re($name, '^(.)+$',"Must pass name to ${module_name}[${title}]")
  validate_re($location, '^(.)+$',"Must pass location to ${module_name}[${title}]")
  validate_re($thumbprint, '^(.)+$', "Must pass a certificate thumbprint to ${module_name}[${title}]")

  ensure_resource('file', 'C:\temp', { ensure => directory })
  file { "inspect-${name}-certificate.ps1" :
    ensure  => present,
    path    => "C:\\temp\\inspect-${name}.ps1",
    content => template('sslcertificate/inspect.ps1.erb'),
    require => File['C:\temp']
  }
  if($::operatingsystemrelease != "6.3.9600"){
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
      require   => [ File["inspect-${name}-certificate.ps1"], File["import-${name}-certificate.ps1"] ],
    }
  }else{ ## Case for 2012 R2. PFX and p12 certificate can't be bind to an iis site.
    file { "import-${name}-certificate.ps1" :
      ensure  => present,
      path    => "C:\\temp\\import-${name}.ps1",
      content => template('sslcertificate/import2012r2.ps1.erb'),
      require => File['C:\temp']
    }
    exec { "Install-${name}-SSLCert":
      provider  => powershell,
      command   => "c:\\temp\\import-${name}.ps1",
      onlyif    => "c:\\temp\\inspect-${name}.ps1",
      logoutput => true,
      require   => [ File["inspect-${name}-certificate.ps1"], File["import-${name}-certificate.ps1"] ],
    }
  }
}
