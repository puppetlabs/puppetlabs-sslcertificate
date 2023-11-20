# SSL Certificate module for Puppet

[![Donated by Vox Pupuli](https://img.shields.io/badge/donated%20by-Vox%20Pupuli-fb7047.svg)](#transfer-notice)

#### Table of Contents

1. [Overview](#overview)
1. [Module Description - What the module does and why it is useful](#module-description)
1. [Setup - The basics of getting started with sslcertificate](#setup)
    * [What sslcertificate affects](#what-sslcertificate-affects)
    * [Beginning with sslcertificate](#beginning-with-sslcertificate)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [License](#license)
1. [Development - Guide for contributing to the module](#development)

## Overview

Small defined type that will allow you to manage Windows certificates.

## Module Description

A module that will allow you to install your certificates on Windows
machines. It will manage pfx, cer, der, p7b, sst certificates.

## Setup

### What sslcertificate affects

* Installs certificates into your Windows key stores

### Beginning with sslcertificate

  To install a certificate in the My directory of the LocalMachine root store:

```puppet
    sslcertificate { "Install-PFX-Certificate" :
      name       => 'mycert.pfx',
      password   => 'password123',
      location   => 'C:\',
      thumbprint => '07E5C1AF7F5223CB975CC29B5455642F5570798B'
    }
```

  To install a certificate in an alternative directory:

```puppet
    sslcertificate { "Install-Intermediate-Certificate" :
      name       => 'go_daddy_intermediate.p7b',
      location   => 'C:\',
      store_dir  => 'CA',
      root_store => 'LocalMachine',
      thumbprint => '07E5C1AF7F5223CB975CC29B5455642F5570798B'
    }
```

To install a certificate in the My directory of the LocalMachine root store and set the key as not exportable:
```puppet
    sslcertificate { "Install-PFX-Certificate" :
      name           => 'mycert.pfx',
      password       => 'password123',
      location       => 'C:',
      thumbprint     => '07E5C1AF7F5223CB975CC29B5455642F5570798B',
      exportable  => false
  }
```

  For more details on the different options available with certificate management
  directories, see [Windows Dev Center](http://msdn.microsoft.com/en-us/library/windows/desktop/aa388136(v=vs.85).aspx).

## Usage

### Classes and Defined Types

#### Defined Type: `sslcertificate`

The primary definition of the sslcertificate module. This definition will install the
certificates into your keystore(s).

**Parameters within `sslcertificate`:**

##### `password`

The password for the given certificate

##### `location`

The location where the file certificate is.
Do not end the string with any forward or backslash.
Note that in puppet manifests, double-backslashes must be re-doubled, even in single-quoted strings, e.g.

```puppet
    sslcertificate { "Install-PFX-Certificate from UNC path" :
      name       => 'mycert.pfx',
      password   => 'password123',
      location   => '\\\\StorageServer\Fileshare',
      thumbprint => '07E5C1AF7F5223CB975CC29B5455642F5570798B'
    }
```

##### `thumbprint`

The thumbprint used to verify the certificate

##### `store_dir`

The certifcate store where the certificate will be installed to

##### `root_store`

The store location for the given certification store. Either LocalMachine or CurrentUser

##### `scripts_dir`

This parameter has been deprecated and isn't used anymore. The scripts aren't saved to disk anymore.

##### `exportable`

Flag to set the key as exportable. `true` == exportable; `false` == not exportable. By default is set to `true`.

##### `wildcard`

Flag to set the MachineKeySet flag in import, used for importing wildcard certificates. Defaults to `false`

##### `interstore`

If this is set to `true`, any intermediate certificates included will be imported in the same store_dir, not the intermediate store.
Defaults to `false`

## Reference

### Definition

#### Public Definition

* [`sslcertificate`](#define-sslcertificate): Guides the installation of certificates

## Limitations

This module is tested on the following platforms:

* Windows 2008 R2

It is tested with the OSS version of Puppet only.

## License

This codebase is licensed under the Apache2.0 licensing, however due to the nature of the codebase the open source dependencies may also use a combination of [AGPL](https://www.gnu.org/licenses/agpl-3.0.en.html), [BSD-2](https://opensource.org/license/bsd-2-claus), [BSD-3](https://opensource.org/license/bsd-3-claus), [GPL2.0](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html), [LGPL](https://opensource.org/license/lgpl-3-0/), [MIT](https://opensource.org/license/mit/) and [MPL](https://opensource.org/license/mpl-2-0/) Licensing.

## Development

### Contributing

Please read CONTRIBUTING.md for full details on contributing to this project.

## Transfer notice

This module was previously maintained by Vox Pupuli. It was migrated to Puppet/Perforce in 2023.
