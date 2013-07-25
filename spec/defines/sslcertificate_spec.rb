require 'spec_helper'

powershell = 'powershell.exe -ExecutionPolicy RemoteSigned'

describe 'sslcertificate', :type => :define do
  describe 'when managing a ssl certificate' do
    let(:title) { 'certificate-testCert' }
    let(:params) { {
        :name       => 'testCert',
        :password   => 'testPass',
        :location   => 'C:\SslCertificates',
        :root_store => 'LocalMachine',
        :store_dir  => 'My',
    } }

    it { should contain_exec('Install-SSL-Certificate-testCert').with ({
      'command' => "#{powershell} -Command \"Import-Module WebAdministration; \$pfx = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2; \$pfxPass = ConvertTo-SecureString \\\"testPass\\\" -asplaintext -force; \$pfx.import(\\\"C:\\SslCertificates\\testCert.pfx\\\",\$pfxPass,\\\"Exportable,PersistKeySet\\\"); \$store = New-Object System.Security.Cryptography.X509Certificates.X509Store(\\\"My\\\", \\\"LocalMachine\\\"); \$store.open(\\\"MaxAllowed\\\"); \$store.add(\$pfx); \$store.close();\"",
      'onlyif'  => "#{powershell} -Command \"Import-Module WebAdministration; if(Get-ChildItem cert:\\ -Recurse | Where-Object {\$_.FriendlyName -match \\\"testCert\\\" } | Select-Object -First 1) { exit 1 } else { exit 0 }\"",
    })}
  end

  describe 'when managing a ssl certificate and supplying a filename' do
    let(:title) { 'certificate-testCert' }
    let(:params) { {
        :name       => 'testCert',
        :password   => 'testPass',
        :location   => 'C:\SslCertificates',
        :root_store => 'LocalMachine',
        :store_dir  => 'My',
        :filename   => 'testCertFile.pfx'
    } }

    it { should contain_exec('Install-SSL-Certificate-testCert').with ({
        'command' => "#{powershell} -Command \"Import-Module WebAdministration; \$pfx = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2; \$pfxPass = ConvertTo-SecureString \\\"testPass\\\" -asplaintext -force; \$pfx.import(\\\"C:\\SslCertificates\\testCertFile.pfx\\\",\$pfxPass,\\\"Exportable,PersistKeySet\\\"); \$store = New-Object System.Security.Cryptography.X509Certificates.X509Store(\\\"My\\\", \\\"LocalMachine\\\"); \$store.open(\\\"MaxAllowed\\\"); \$store.add(\$pfx); \$store.close();\"",
        'onlyif'  => "#{powershell} -Command \"Import-Module WebAdministration; if(Get-ChildItem cert:\\ -Recurse | Where-Object {\$_.FriendlyName -match \\\"testCert\\\" } | Select-Object -First 1) { exit 1 } else { exit 0 }\"",
    })}
  end

  describe 'when no certificate name is provided' do
    let(:title) { 'certificate-testCert' }
    let(:params) { {
        :password   => 'testPass',
        :location   => 'C:\SslCertificates',
        :root_store => 'LocalMachine',
        :store_dir  => 'My',
    }}

    it { expect { should contain_exec('Install-SSL-Certificate-testCert')}.to raise_error(Puppet::Error, /Must pass name to Sslcertificate\[certificate-testCert\]/) }
  end

  describe 'when empty certificate name is provided' do
    let(:title) { 'certificate-testCert' }
    let(:params) { {
        :name       => '',
        :password   => 'testPass',
        :location   => 'C:\SslCertificates',
        :root_store => 'LocalMachine',
        :store_dir  => 'My',
    }}

    it { expect { should contain_exec('Install-SSL-Certificate-testCert')}.to raise_error(Puppet::Error, /Must pass name to sslcertificate/) }
  end

  describe 'when no certificate password is provided' do
    let(:title) { 'certificate-testCert' }
    let(:params) { {
        :name       => 'testCert',
        :location   => 'C:\SslCertificates',
        :root_store => 'LocalMachine',
        :store_dir  => 'My',
    }}

    it { expect { should contain_exec('Install-SSL-Certificate-testCert')}.to raise_error(Puppet::Error, /Must pass password to Sslcertificate\[certificate-testCert\]/) }
  end

  describe 'when empty certificate password is provided' do
    let(:title) { 'certificate-testCert' }
    let(:params) { {
        :name       => 'testCert',
        :password   => '',
        :location   => 'C:\SslCertificates',
        :root_store => 'LocalMachine',
        :store_dir  => 'My',
    }}

    it { expect { should contain_exec('Install-SSL-Certificate-testCert')}.to raise_error(Puppet::Error, /Must pass password to sslcertificate/) }
  end

  describe 'when no certificate location is provided' do
    let(:title) { 'certificate-testCert' }
    let(:params) { {
        :name       => 'testCert',
        :password   => 'testPass',
        :root_store => 'LocalMachine',
        :store_dir  => 'My',
    }}

    it { expect { should contain_exec('Install-SSL-Certificate-testCert')}.to raise_error(Puppet::Error, /Must pass location to Sslcertificate\[certificate-testCert\]/) }
  end

  describe 'when empty certificate location is provided' do
    let(:title) { 'certificate-testCert' }
    let(:params) { {
        :name       => 'testCert',
        :password   => 'testPass',
        :location   => '',
        :root_store => 'LocalMachine',
        :store_dir  => 'My',
    }}

    it { expect { should contain_exec('Install-SSL-Certificate-testCert')}.to raise_error(Puppet::Error, /Must pass location to sslcertificate/) }
  end
end

