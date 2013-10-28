define sslcertificate::intermediate($name, $password, $location, $root_store = 'LocalMachine', $store_dir = 'My', $filename) {
  validate_re($name, ['^(.)+$'],"Must pass name to ${module_name}\[${title}\]")
  validate_re($password, ['^(.)+$'],"Must pass password to ${module_name}\[${title}\]")
  validate_re($location, ['^(.)+$'],"Must pass location to ${module_name}\[${title}\]")

  $ps_command = 'powershell.exe -ExecutionPolicy RemoteSigned'
  $ps_path = 'C:\Windows\sysnative\WindowsPowershell\v1.0'

  $cert_path = "${location}\\${filename}"

  exec { "Install-Intermediate-Certificate-${name}":
    path      => "${ps_path};${::path}",
    command   => "${ps_command} -Command \"Import-Module WebAdministration; \$pfx = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2Collection; \$pfx.import([System.IO.File]::ReadAllBytes(\\\"${cert_path}\\\")); \$store = New-Object System.Security.Cryptography.X509Certificates.X509Store(\\\"${store_dir}\\\", \\\"${root_store}\\\"); \$pfx | %{\$store.Add(\$_)}; \$store.open([System.Security.Cryptography.X509Certificates.OpenFlags]::ReadWrite); \$store.addrange(\$pfx); \$store.close();\"",
    onlyif    => "${ps_command} -Command \"Import-Module WebAdministration; if(Get-ChildItem cert:\\ -Recurse | Where-Object {\$_.FriendlyName -match \\\"${name}\\\" } | Select-Object -First 1) { exit 1 } else { exit 0 }\"",
    logoutput => true,
  }
}