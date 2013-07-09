define sslcertificate($name, $password, $location, $root_store = 'LocalMachine', $store_dir = 'My') {
  validate_re($name, ['^(.)+$'],"Must pass name to ${module_name}\[${title}\]")
  validate_re($password, ['^(.)+$'],"Must pass password to ${module_name}\[${title}\]")
  validate_re($location, ['^(.)+$'],"Must pass location to ${module_name}\[${title}\]")

  $ps_command = 'powershell.exe -ExecutionPolicy RemoteSigned'
  $ps_path = 'C:\Windows\sysnative\WindowsPowershell\v1.0'

  $filename = "${name}.pfx"
  $cert_path = "${location}\\${filename}"

  exec { "Install-SSL-Certificate-${name}":
    path      => "${ps_path};${::path}",
    command   => "${ps_command} -Command \"Import-Module WebAdministration; \$pfx = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2; \$pfxPass = ConvertTo-SecureString \\\"${password}\\\" -asplaintext -force; \$pfx.import(\\\"${cert_path}\\\",\$pfxPass,\\\"Exportable,PersistKeySet\\\"); \$store = New-Object System.Security.Cryptography.X509Certificates.X509Store(\\\"${store_dir}\\\", \\\"${root_store}\\\"); \$store.open(\\\"MaxAllowed\\\"); \$store.add(\$pfx); \$store.close();\"",
    onlyif    => "${ps_command} -Command \"Import-Module WebAdministration; if(Get-ChildItem cert:\\ -Recurse | Where-Object {\$_.FriendlyName -match \\\"${name}\\\" } | Select-Object -First 1) { exit 1 } else { exit 0 }\"",
    require   => File[$cert_path],
    logoutput => true,
  }
}
