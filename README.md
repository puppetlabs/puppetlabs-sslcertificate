puppet-sslcert
==============

Small define that will allow you to manage Windows certificates. It will manage pfx, cer, der, p7b, sst certificates.

[![Build Status](https://travis-ci.org/opentable/puppet-sslcert.png?branch=master)](https://travis-ci.org/opentable/puppet-sslcert)

This module has been changed to require a certificate thumbprint. This is for 2 reasons:

* We want to make sure that the certificate that you are requesting to install is actually the correct certificate. We verify the thumbprint parameter against the thumbprint of the certificate
* We can identify your certificate from any certificate chains. This allows us to put the correct certificates in the correct certificate stores

Usage
--

    sslcertificate { "Install-PFX-Certificate" :
    	name       => 'mycert.pfx',
    	password   => 'password123',
    	location   => 'C:\',
    	thumbprint => '07E5C1AF7F5223CB975CC29B5455642F5570798B'
    }
    
By default, it will store the certificate in Local Machine root store and in the My directory. If you want to change these, then use the parameters as follows:


    sslcertificate { "Install-Intermediate-Certificate" :
    	name       => 'go_daddy_intermediate.p7b',
    	location   => 'C:\',
    	store_dir  => 'CA',
    	root_store => 'LocalMachine',
        thumbprint => '07E5C1AF7F5223CB975CC29B5455642F5570798B'
    }
    
For more details on the different options available with certificate management directories, see [Windows Dev Center](http://msdn.microsoft.com/en-us/library/windows/desktop/aa388136(v=vs.85).aspx).

Please note, you must download the file to the host before trying to install it. E.g:

	file { 'go_daddy_intermediate' :
      ensure  => file,
      path    => 'C:\MyCerts',
      source  => "puppet:///modules/certificates/${name}",
    }

	sslcertificate { "Install-Intermediate-Certificate" :
    	name       => 'go_daddy_intermediate.p7b',
    	location   => 'C:\MyCerts',
    	store_dir  => 'CA',
    	root_store => 'LocalMachine',
    	require    => File['go_daddy_intermediate']
    }   
    
The system sits on top of PowerShell, so if the PowerShell file cannot get to the certificate, then it will not be able to install it.