# SSL Certificate module for Puppet

[![Build Status](https://travis-ci.org/voxpupuli/puppet-sslcertificate.png?branch=master)](https://travis-ci.org/voxpupuli/puppet-sslcertificate)
[![Puppet Forge](https://img.shields.io/puppetforge/v/puppet/sslcertificate.svg)](https://forge.puppetlabs.com/puppet/sslcertificate)
[![Puppet Forge - downloads](https://img.shields.io/puppetforge/dt/puppet/sslcertificate.svg)](https://forge.puppetlabs.com/puppet/sslcertificate)
[![Puppet Forge - endorsement](https://img.shields.io/puppetforge/e/puppet/sslcertificate.svg)](https://forge.puppetlabs.com/puppet/sslcertificate)
[![Puppet Forge - scores](https://img.shields.io/puppetforge/f/puppet/sslcertificate.svg)](https://forge.puppetlabs.com/puppet/sslcertificate)

#### Table of Contents

1. [Overview](#overview)
1. [Module Description - What the module does and why it is useful](#module-description)
1. [Setup - The basics of getting started with sslcertificate](#setup)
    * [What sslcertificate affects](#what-sslcertificate-affects)
    * [Beginning with sslcertificate](#beginning-with-sslcertificate)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Overview

Small defined type that will allow you to manage Windows certificates.

## Module Description

A module that will allow you to install and remove your certificates on Windows
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

  To install a certifcate in an alterntative direcotory:

```puppet
    sslcertificate { "Install-Intermediate-Certificate" :
      name       => 'go_daddy_intermediate.p7b',
      location   => 'C:\',
      store_dir  => 'CA',
      root_store => 'LocalMachine',
      thumbprint => '07E5C1AF7F5223CB975CC29B5455642F5570798B'
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

The password for the given certifcate

##### `location`

The location to store intermediate certificates

##### `thumbprint`

The thumbprint used to verify the certifcate

##### `store_dir`

The certifcate store where the certifcate will be installed to

##### `root_store`

The store location for the given certifcation store. Either LocalMachine or CurrentUser

## Reference

### Defintion

#### Public Definition

* [`sslcertificate`](#define-sslcertificate): Guides the installation of certificates

## Limitations

This module is tested on the following platforms:

* Windows 2008 R2

It is tested with the OSS version of Puppet only.

## Development

### Contributing

Please read CONTRIBUTING.md for full details on contributing to this project.
