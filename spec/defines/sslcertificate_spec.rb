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

    it { should contain_exec('Install-testCert-SSLCert')
      .with_command('c:\temp\import-testCert.ps1')
      .with_onlyif('c:\temp\inspect-testCert.ps1')
      .with_provider('powershell')
      .with_require('File[import-testCert-certificate.ps1]')
      .with_require('File[inspect-testCert-certificate.ps1]')
    }

    it{ should contain_file('import-testCert-certificate.ps1')
      .with_ensure('present')
      .with_path('C:\\temp\\import-testCert.ps1')
      .with_content(/store.Add/)
      .with_require('File[C:\temp]')
    }

    it{ should contain_file('inspect-testCert-certificate.ps1')
      .with_ensure('present')
      .with_path('C:\\temp\\inspect-testCert.ps1')
      .with_content(/\$installedCert in \$installedCerts/)
      .with_require('File[C:\temp]')
    }

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

