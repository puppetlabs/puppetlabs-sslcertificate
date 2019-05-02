# Changelog

All notable changes to this project will be documented in this file.
Each new release typically also includes the latest modulesync defaults.
These should not affect the functionality of the module.

## [v4.0.0](https://github.com/voxpupuli/puppet-sslcertificate/tree/v4.0.0) (2019-03-09)

[Full Changelog](https://github.com/voxpupuli/puppet-sslcertificate/compare/v3.4.0...v4.0.0)

**Breaking changes:**

- modulesync 2.5.1 & drop Puppet 4 [\#88](https://github.com/voxpupuli/puppet-sslcertificate/pull/88) ([bastelfreak](https://github.com/bastelfreak))

**Implemented enhancements:**

- Add wildcard & bypass Intermediate Store support [\#84](https://github.com/voxpupuli/puppet-sslcertificate/pull/84) ([arthurbarton](https://github.com/arthurbarton))

**Fixed bugs:**

- PrivateKey directory is filling up [\#33](https://github.com/voxpupuli/puppet-sslcertificate/issues/33)
- Checks if the certificate is installed without creating an object [\#70](https://github.com/voxpupuli/puppet-sslcertificate/pull/70) ([cmezzett](https://github.com/cmezzett))

**Merged pull requests:**

- modulesync 2.2.0 and allow puppet 6.x [\#85](https://github.com/voxpupuli/puppet-sslcertificate/pull/85) ([bastelfreak](https://github.com/bastelfreak))
- Do not remove scripts as they are not stored on disk [\#76](https://github.com/voxpupuli/puppet-sslcertificate/pull/76) ([walkamongus](https://github.com/walkamongus))

## [v3.4.0](https://github.com/voxpupuli/puppet-sslcertificate/tree/v3.4.0) (2018-09-07)

[Full Changelog](https://github.com/voxpupuli/puppet-sslcertificate/compare/v3.3.0...v3.4.0)

**Implemented enhancements:**

- Allow managing SSL certificates without a password [\#64](https://github.com/voxpupuli/puppet-sslcertificate/issues/64)

**Merged pull requests:**

- allow puppetlabs/stdlib 5.x [\#80](https://github.com/voxpupuli/puppet-sslcertificate/pull/80) ([bastelfreak](https://github.com/bastelfreak))
- Remove docker nodesets [\#75](https://github.com/voxpupuli/puppet-sslcertificate/pull/75) ([bastelfreak](https://github.com/bastelfreak))
- drop EOL OSs; fix puppet version range [\#73](https://github.com/voxpupuli/puppet-sslcertificate/pull/73) ([bastelfreak](https://github.com/bastelfreak))

## [v3.3.0](https://github.com/voxpupuli/puppet-sslcertificate/tree/v3.3.0) (2018-02-13)

[Full Changelog](https://github.com/voxpupuli/puppet-sslcertificate/compare/v3.2.0...v3.3.0)

**Implemented enhancements:**

- Don't store the PS1 scripts [\#66](https://github.com/voxpupuli/puppet-sslcertificate/pull/66) ([natemccurdy](https://github.com/natemccurdy))
- Make the password parameter optional [\#65](https://github.com/voxpupuli/puppet-sslcertificate/pull/65) ([rnelson0](https://github.com/rnelson0))

**Merged pull requests:**

- Cleanup script after invocation [\#61](https://github.com/voxpupuli/puppet-sslcertificate/pull/61) ([rdev5](https://github.com/rdev5))

## [v3.2.0](https://github.com/voxpupuli/puppet-sslcertificate/tree/v3.2.0) (2017-11-20)

[Full Changelog](https://github.com/voxpupuli/puppet-sslcertificate/compare/v3.1.0...v3.2.0)

**Merged pull requests:**

- bump puppet version dependency to \>= 4.7.1 \< 6.0.0 [\#59](https://github.com/voxpupuli/puppet-sslcertificate/pull/59) ([bastelfreak](https://github.com/bastelfreak))

## [v3.1.0](https://github.com/voxpupuli/puppet-sslcertificate/tree/v3.1.0) (2017-09-17)

[Full Changelog](https://github.com/voxpupuli/puppet-sslcertificate/compare/v3.0.0...v3.1.0)

**Merged pull requests:**

- Update import.ps1.erb to work with P12 format [\#48](https://github.com/voxpupuli/puppet-sslcertificate/pull/48) ([tramaswami](https://github.com/tramaswami))

## [v3.0.0](https://github.com/voxpupuli/puppet-sslcertificate/tree/v3.0.0) (2017-06-26)

[Full Changelog](https://github.com/voxpupuli/puppet-sslcertificate/compare/v2.2.0...v3.0.0)

**Implemented enhancements:**

- Set mode to 0600 on sensitive scripts [\#54](https://github.com/voxpupuli/puppet-sslcertificate/pull/54) ([roidelapluie](https://github.com/roidelapluie))
- New argument to set exportability of the certificate [\#46](https://github.com/voxpupuli/puppet-sslcertificate/pull/46) ([ricardogaspar2](https://github.com/ricardogaspar2))

**Fixed bugs:**

- Fixing typo [\#50](https://github.com/voxpupuli/puppet-sslcertificate/pull/50) ([thirumoorthir](https://github.com/thirumoorthir))

**Closed issues:**

- Certificate for testing [\#44](https://github.com/voxpupuli/puppet-sslcertificate/issues/44)

**Merged pull requests:**

- release 3.0.0 [\#55](https://github.com/voxpupuli/puppet-sslcertificate/pull/55) ([bastelfreak](https://github.com/bastelfreak))
- replace validate\_\* with puppet4 datatypes [\#52](https://github.com/voxpupuli/puppet-sslcertificate/pull/52) ([bastelfreak](https://github.com/bastelfreak))

## [v2.2.0](https://github.com/voxpupuli/puppet-sslcertificate/tree/v2.2.0) (2017-02-11)

[Full Changelog](https://github.com/voxpupuli/puppet-sslcertificate/compare/v2.1.1...v2.2.0)

**Closed issues:**

- Undocumented dependency on module puppetlabs/powershell [\#23](https://github.com/voxpupuli/puppet-sslcertificate/issues/23)

**Merged pull requests:**

- modulesync 0.16.7 [\#39](https://github.com/voxpupuli/puppet-sslcertificate/pull/39) ([bastelfreak](https://github.com/bastelfreak))
- Set min version\_requirement for Puppet + bump deps [\#36](https://github.com/voxpupuli/puppet-sslcertificate/pull/36) ([juniorsysadmin](https://github.com/juniorsysadmin))
- modulesync 0.16.6 [\#35](https://github.com/voxpupuli/puppet-sslcertificate/pull/35) ([bastelfreak](https://github.com/bastelfreak))
- modulesync 0.16.4 [\#34](https://github.com/voxpupuli/puppet-sslcertificate/pull/34) ([bastelfreak](https://github.com/bastelfreak))
- modulesync 0.16.3 [\#32](https://github.com/voxpupuli/puppet-sslcertificate/pull/32) ([bastelfreak](https://github.com/bastelfreak))
- Fix references to `sslcert` [\#30](https://github.com/voxpupuli/puppet-sslcertificate/pull/30) ([alexjfisher](https://github.com/alexjfisher))
- modulesync 0.15.0 [\#28](https://github.com/voxpupuli/puppet-sslcertificate/pull/28) ([bastelfreak](https://github.com/bastelfreak))
- Add missing badges [\#27](https://github.com/voxpupuli/puppet-sslcertificate/pull/27) ([dhoppe](https://github.com/dhoppe))
- Update based on voxpupuli/modulesync\_config 0.14.1 [\#26](https://github.com/voxpupuli/puppet-sslcertificate/pull/26) ([dhoppe](https://github.com/dhoppe))
- Fix README.md [\#21](https://github.com/voxpupuli/puppet-sslcertificate/pull/21) ([madAndroid](https://github.com/madAndroid))
- Perform modulesync \(0.3.0\) [\#20](https://github.com/voxpupuli/puppet-sslcertificate/pull/20) ([juniorsysadmin](https://github.com/juniorsysadmin))
- Modulesync \(modulesync\_config 0.1.0\) [\#19](https://github.com/voxpupuli/puppet-sslcertificate/pull/19) ([juniorsysadmin](https://github.com/juniorsysadmin))
- Fix installing single certificates [\#18](https://github.com/voxpupuli/puppet-sslcertificate/pull/18) ([damoxc](https://github.com/damoxc))
- Perform a modulesync [\#17](https://github.com/voxpupuli/puppet-sslcertificate/pull/17) ([juniorsysadmin](https://github.com/juniorsysadmin))
- Added support for managing .P12 certificates [\#4](https://github.com/voxpupuli/puppet-sslcertificate/pull/4) ([Mharlin](https://github.com/Mharlin))

## [v2.1.1](https://github.com/voxpupuli/puppet-sslcertificate/tree/v2.1.1) (2015-03-24)

[Full Changelog](https://github.com/voxpupuli/puppet-sslcertificate/compare/v2.1.0...v2.1.1)

## [v2.1.0](https://github.com/voxpupuli/puppet-sslcertificate/tree/v2.1.0) (2014-10-13)

[Full Changelog](https://github.com/voxpupuli/puppet-sslcertificate/compare/v2.0.2...v2.1.0)

## [v2.0.2](https://github.com/voxpupuli/puppet-sslcertificate/tree/v2.0.2) (2014-08-04)

[Full Changelog](https://github.com/voxpupuli/puppet-sslcertificate/compare/v2.0.1...v2.0.2)

## [v2.0.1](https://github.com/voxpupuli/puppet-sslcertificate/tree/v2.0.1) (2014-08-04)

[Full Changelog](https://github.com/voxpupuli/puppet-sslcertificate/compare/v2.0.0...v2.0.1)

**Merged pull requests:**

- Adding more pupept version coverage to the module [\#6](https://github.com/voxpupuli/puppet-sslcertificate/pull/6) ([stack72](https://github.com/stack72))

## [v2.0.0](https://github.com/voxpupuli/puppet-sslcertificate/tree/v2.0.0) (2014-04-16)

[Full Changelog](https://github.com/voxpupuli/puppet-sslcertificate/compare/v1.0.1...v2.0.0)

**Merged pull requests:**

- Moving to use certificate thumbprints [\#5](https://github.com/voxpupuli/puppet-sslcertificate/pull/5) ([stack72](https://github.com/stack72))

## [v1.0.1](https://github.com/voxpupuli/puppet-sslcertificate/tree/v1.0.1) (2014-03-14)

[Full Changelog](https://github.com/voxpupuli/puppet-sslcertificate/compare/v1.0.0...v1.0.1)

## [v1.0.0](https://github.com/voxpupuli/puppet-sslcertificate/tree/v1.0.0) (2014-03-12)

[Full Changelog](https://github.com/voxpupuli/puppet-sslcertificate/compare/67919d208e50ac9156ecda32e09c4efc5ca6fca8...v1.0.0)

**Merged pull requests:**

- Intermediate certificates [\#3](https://github.com/voxpupuli/puppet-sslcertificate/pull/3) ([stack72](https://github.com/stack72))
- added filename parameter [\#1](https://github.com/voxpupuli/puppet-sslcertificate/pull/1) ([amwilson](https://github.com/amwilson))



\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
