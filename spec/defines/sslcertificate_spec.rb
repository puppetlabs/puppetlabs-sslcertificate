require 'spec_helper'

describe 'sslcertificate', type: :define do
  describe 'when managing a ssl certificate' do
    let(:title) { 'certificate-testCert' }
    let(:params) do
      {
        name: 'testCert',
        password: 'testPass',
        location: 'C:\SslCertificates',
        thumbprint: '07E5C1AF7F5223CB975CC29B5455642F5570798B',
        root_store: 'LocalMachine',
        store_dir: 'My'
      }
    end

    it do
      is_expected.to contain_exec('Install-testCert-SSLCert').with(
        'command'  => 'C:\temp\import-testCert.ps1',
        'onlyif'   => 'C:\temp\inspect-testCert.ps1',
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
        thumbprint: '07E5C1AF7F5223CB975CC29B5455642F5570798B',
        root_store: 'LocalMachine',
        store_dir: 'My',
        scripts_dir: 'C:\scripts'
      }
    end

    it do
      is_expected.to contain_exec('Install-testCert-SSLCert').with(
        'command'  => 'C:\scripts\import-testCert.ps1',
        'onlyif'   => 'C:\scripts\inspect-testCert.ps1',
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

  describe 'when managing a ssl certificate and set the key as not exportable' do
    let(:title) { 'certificate-testCert' }
    let(:params) do
      {
        name: 'testCert',
        password: 'testPass',
        location: 'C:\SslCertificates',
        thumbprint: '07E5C1AF7F5223CB975CC29B5455642F5570798B',
        root_store: 'LocalMachine',
        store_dir: 'My',
        exportable: false
      }
    end

    it do
      is_expected.to contain_exec('Install-testCert-SSLCert').with(
        'command'  => 'C:\temp\import-testCert.ps1',
        'onlyif'   => 'C:\temp\inspect-testCert.ps1',
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

    it { is_expected.to contain_file('import-testCert-certificate.ps1').without_content(%r{Exportable,PersistKeySet}) }

    it do
      is_expected.to contain_file('inspect-testCert-certificate.ps1').with(
        'ensure'  => 'present',
        'path'    => 'C:\\temp\\inspect-testCert.ps1',
        'require' => 'File[C:\temp]'
      )
    end
    it { is_expected.to contain_file('inspect-testCert-certificate.ps1').without_content(%r{Exportable,PersistKeySet}) }
  end

  describe 'when no certificate password is provided' do
    let(:title) { 'certificate-testCert' }
    let(:params) do
      {
        name:       'testCert',
        location:   'C:\SslCertificates',
        root_store: 'LocalMachine',
        store_dir:  'My'
      }
    end
    it { is_expected.to contain_exec('Install-SSL-Certificate-testCert') }
  end
end
