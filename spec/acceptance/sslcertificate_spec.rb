# frozen_string_literal: true

require 'spec_helper_acceptance'

RSpec.configure do |c|
  c.before(:suite) do
    pp = <<~PP
      sslcertificate { "Install-PFX-Certificate" :
        name       => 'mycert.pfx',
        password   => 'password123',
        location   => 'C:',
        thumbprint => '07E5C1AF7F5223CB975CC29B5455642F5570798B'
      }

      sslcertificate { "Install-Intermediate-Certificate" :
        name       => 'go_daddy_intermediate.p7b',
        location   => 'C:',
        store_dir  => 'CA',
        root_store => 'LocalMachine',
        thumbprint => '07E5C1AF7F5223CB975CC29B5455642F5570798B'
      }
    PP
    Helper.instance.apply_manifest(pp, catch_failures: true)
  end
end
