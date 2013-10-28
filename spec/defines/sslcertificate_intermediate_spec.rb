require 'spec_helper'

powershell = 'powershell.exe -ExecutionPolicy RemoteSigned'

describe 'sslcertificate::intermediate', :type => :define do
  describe 'when managing a ssl certificate' do
    let(:title) { 'certificate-testCert' }
    let(:params) { {
        :name       => 'testCert',
        :password   => 'testPass',
        :location   => 'C:\SslCertificates',
        :root_store => 'LocalMachine',
        :store_dir  => 'My',
        :filename   => 'testCert.p7b',
    } }

    it { should contain_exec('Install-Intermediate-Certificate-testCert').with ({
      'command' => "#{powershell} -Command \"Import-Module WebAdministration; \$pfx = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2Collection; \$pfx.import([System.IO.File]::ReadAllBytes(\\\"C:\\SslCertificates\\testCert.p7b\\\")); \$store = New-Object System.Security.Cryptography.X509Certificates.X509Store(\\\"My\\\", \\\"LocalMachine\\\"); \$pfx | %{\$store.Add(\$_)}\; \$store.open([System.Security.Cryptography.X509Certificates.OpenFlags]::ReadWrite); \$store.addrange(\$pfx); \$store.close();\"",
      'onlyif'  => "#{powershell} -Command \"Import-Module WebAdministration; if(Get-ChildItem cert:\\ -Recurse | Where-Object {\$_.FriendlyName -match \\\"testCert\\\" } | Select-Object -First 1) { exit 1 } else { exit 0 }\"",
    })}
  end
end

