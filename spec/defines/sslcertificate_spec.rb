require 'spec_helper'

describe 'sslcertificate', type: :define do
  describe 'when managing a ssl certificate' do
    let(:title) { 'certificate-testCert' }
    let(:params) do
      {
        name: 'testCert',
        password: 'testPass',
        location: 'C:\SslCertificates',
        thumbprint: '9CFC2688E5C1836F14E5E11D9C8CBEB9006E7426',
        root_store: 'LocalMachine',
        store_dir: 'My'
      }
    end

    it do
      is_expected.to contain_exec('Install-testCert-SSLCert').with(
        'command'  => 'c:\temp\import-testCert.ps1',
        'onlyif'   => 'c:\temp\inspect-testCert.ps1',
        'provider' => 'powershell'
      )
    end

    it do
      is_expected.to contain_file('import-testCert-certificate.ps1').with(
        'ensure'  => 'present',
        'path'    => 'C:\\temp\\import-testCert.ps1',
        'require' => 'File[C:\temp]'
      )
    end

    it { is_expected.to contain_file('import-testCert-certificate.ps1').with_content(%r{store.Add}) }

    it do
      is_expected.to contain_file('inspect-testCert-certificate.ps1').with(
        'ensure'  => 'present',
        'path'    => 'C:\\temp\\inspect-testCert.ps1',
        'require' => 'File[C:\temp]'
      )
    end
    it { is_expected.to contain_file('inspect-testCert-certificate.ps1').with_content(%r{\$installedCert in \$installedCerts}) }
  end

 describe 'when managing a ssl certificate specifying a directory for scripts' do
    let(:title) { 'certificate-testCert' }
    let(:params) do
      {
        name: 'testCert',
        password: 'testPass',
        location: 'C:\SslCertificates',
        thumbprint: '9CFC2688E5C1836F14E5E11D9C8CBEB9006E7426',
        root_store: 'LocalMachine',
        store_dir: 'My',
	      scripts_dir: 'c:\\scripts'
      }
    end

    it do
      is_expected.to contain_exec('Install-testCert-SSLCert').with(
        'command'  => 'c:\scripts_dir\import-testCert.ps1',
        'onlyif'   => 'c:\scripts\inspect-testCert.ps1',
        'provider' => 'powershell'
      )
    end

    it do
      is_expected.to contain_file('import-testCert-certificate.ps1').with(
        'ensure'  => 'present',
        'path'    => 'C:\\scripts\\import-testCert.ps1',
        'require' => 'File[C:\scripts]'
      )
    end

    it { is_expected.to contain_file('import-testCert-certificate.ps1').with_content(%r{store.Add}) }

    it do
      is_expected.to contain_file('inspect-testCert-certificate.ps1').with(
        'ensure'  => 'present',
        'path'    => 'C:\\scripts\\inspect-testCert.ps1',
        'require' => 'File[C:\scripts]'
      )
    end
    it { is_expected.to contain_file('inspect-testCert-certificate.ps1').with_content(%r{\$installedCert in \$installedCerts}) }
  end

  describe 'when empty certificate name is provided' do
    let(:title) { 'certificate-testCert' }
    let(:params) do
      {
        name: '',
        password: 'testPass',
        location: 'C:\SslCertificates',
        thumbprint: '9CFC2688E5C1836F14E5E11D9C8CBEB9006E7426',
        root_store: 'LocalMachine',
        store_dir: 'My'
      }
    end

    it { expect { is_expected.to contain_exec('Install-SSL-Certificate-testCert') }.to raise_error(Puppet::Error, %r{Must pass name to sslcertificate}) }
  end

  # TODO: this needs to be corrected
  # describe 'when no certificate password is provided' do
  #  let(:title) { 'certificate-testCert' }
  #  let(:params) { {
  #      :name       => 'testCert',
  #      :location   => 'C:\SslCertificates',
  #      :root_store => 'LocalMachine',
  #      :store_dir  => 'My',
  #  }}
  #
  #  it { expect { should contain_exec('Install-SSL-Certificate-testCert')}.to raise_error(Puppet::Error, /Must pass password to Sslcertificate\[certificate-testCert\]/) }
  # end

  describe 'when no certificate location is provided' do
    let(:title) { 'certificate-testCert' }
    let(:params) do
      {
        name: 'testCert',
        password: 'testPass',
        thumbprint: '9CFC2688E5C1836F14E5E11D9C8CBEB9006E7426',
        root_store: 'LocalMachine',
        store_dir: 'My'
      }
    end

    it { expect { is_expected.to contain_exec('Install-SSL-Certificate-testCert') }.to raise_error(Puppet::Error) }
  end

  describe 'when empty certificate location is provided' do
    let(:title) { 'certificate-testCert' }
    let(:params) do
      {
        name: 'testCert',
        password: 'testPass',
        location: '',
        thumbprint: '9CFC2688E5C1836F14E5E11D9C8CBEB9006E7426',
        root_store: 'LocalMachine',
        store_dir: 'My'
      }
    end

    it { expect { is_expected.to contain_exec('Install-SSL-Certificate-testCert') }.to raise_error(Puppet::Error, %r{Must pass location to sslcertificate}) }
  end

  describe 'when no certificate thumbprint is provided' do
    let(:title) { 'certificate-testCert' }
    let(:params) do
      {
        name: 'testCert',
        password: 'testPass',
        location: 'C:\SslCertificates',
        root_store: 'LocalMachine',
        store_dir: 'My'
      }
    end

    it { expect { is_expected.to contain_exec('Install-SSL-Certificate-testCert') }.to raise_error(Puppet::Error) }
  end
end
