# Changelog

## 2016-02-11 - Release 2.2.0

The is the last release with Puppet3 support!
* Set min version_requirement for Puppet + bump deps
* Add dependency on module puppetlabs/powershell
* Fix URLs in metadata.json
* Fix several rubocop issues
* Add missing badges
* Fix several markdown issues
* Fix several rubocop issues
* Add support for managing .P12 certificates
* Fix installing a single certificate from a .{crt,cer,der,p12}

## 2014-10-13 - Release 2.1.0
### Summary

  Improving documentation and testing for puppet approved.

## 2014-08-04 - Release 2.0.2
### Summary

  Fixing bug in the case sensitivity of ensure_resource

## 2014-08-04 - Release 2.0.1
### Summary

  Switching module to use ensure_resource rather than if defined for it's file dependencies

## 2014-04-16 - Release 2.0.0
### Summary

  This release adds a few new features. This biggest of these is using certificate thumbprints to verify certicates.
  We can now identify your certificate from any certificate chains. This allows us to put the correct certificates in
  the correct certificate stores

### Features

- manage .crt certificates
- updating to use certificate thumbprint

## 2014-03-14 - Release 1.0.1
### Summary

  Fixes bug in inspect.ps1 using incorrect variable

## 2014-03-12 - Release 1.0.0
### Summary

  Initial version.
