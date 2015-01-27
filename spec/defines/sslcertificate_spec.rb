require 'spec_helper'

describe 'sslcertificate', :type => :define do
  describe 'when managing a ssl certificate' do
    let(:title) { 'certificate-testCert' }
    let(:params) { {
        :name       => 'testCert',
        :password   => 'testPass',
        :location   => 'C:\SslCertificates',
        :thumbprint => '07E5C1AF7F5223CB975CC29B5455642F5570798B',
        :root_store => 'LocalMachine',
        :store_dir  => 'My',
    } }

    it { should contain_exec('Install-testCert-SSLCert').with(
      'command'  => 'template("sslcertificate/import.ps1.erb")',
      'onlyif'   => 'template("sslcertificate/inspect.ps1.erb")',
      'provider' => 'powershell'
    )}


  end

  describe 'when empty certificate name is provided' do
    let(:title) { 'certificate-testCert' }
    let(:params) { {
        :name       => '',
        :password   => 'testPass',
        :location   => 'C:\SslCertificates',
        :thumbprint => '07E5C1AF7F5223CB975CC29B5455642F5570798B',
        :root_store => 'LocalMachine',
        :store_dir  => 'My',
    }}

    it { expect { should contain_exec('Install-SSL-Certificate-testCert')}.to raise_error(Puppet::Error, /Must pass name to sslcertificate/) }
  end

  #TODO: this needs to be corrected
  #describe 'when no certificate password is provided' do
  #  let(:title) { 'certificate-testCert' }
  #  let(:params) { {
  #      :name       => 'testCert',
  #      :location   => 'C:\SslCertificates',
  #      :root_store => 'LocalMachine',
  #      :store_dir  => 'My',
  #  }}
  #
  #  it { expect { should contain_exec('Install-SSL-Certificate-testCert')}.to raise_error(Puppet::Error, /Must pass password to Sslcertificate\[certificate-testCert\]/) }
  #end

  describe 'when no certificate location is provided' do
    let(:title) { 'certificate-testCert' }
    let(:params) { {
        :name       => 'testCert',
        :password   => 'testPass',
        :thumbprint => '07E5C1AF7F5223CB975CC29B5455642F5570798B',
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
        :thumbprint => '07E5C1AF7F5223CB975CC29B5455642F5570798B',
        :root_store => 'LocalMachine',
        :store_dir  => 'My',
    }}

    it { expect { should contain_exec('Install-SSL-Certificate-testCert')}.to raise_error(Puppet::Error, /Must pass location to sslcertificate/) }
  end

  describe 'when no certificate thumbprint is provided' do
    let(:title) { 'certificate-testCert' }
    let(:params) { {
        :name       => 'testCert',
        :password   => 'testPass',
        :location   => 'C:\SslCertificates',
        :root_store => 'LocalMachine',
        :store_dir  => 'My',
    }}

    it { expect { should contain_exec('Install-SSL-Certificate-testCert')}.to raise_error(Puppet::Error, /Must pass thumbprint to Sslcertificate/) }
  end
end

