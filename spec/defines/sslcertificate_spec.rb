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
        'provider' => 'powershell'
      ).
        with_command(%r{\$cert = gi "C:\\SslCertificates\\testCert"}).
        with_onlyif(%r{\$certificate = gi "C:\\SslCertificates\\testCert"})
    end
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
        'provider' => 'powershell'
      ).
        with_command(%r{\$cert = gi "C:\\SslCertificates\\testCert"}).
        with_onlyif(%r{\$certificate = gi "C:\\SslCertificates\\testCert"})
    end
  end

  describe 'when no certificate password is provided' do
    let(:title) { 'certificate-testCert' }
    let(:params) do
      {
        name:       'testCert',
        location:   'C:\SslCertificates',
        thumbprint: '07E5C1AF7F5223CB975CC29B5455642F5570798B',
        root_store: 'LocalMachine',
        store_dir:  'My'
      }
    end

    it { is_expected.to contain_exec('Install-testCert-SSLCert') }
  end
end
