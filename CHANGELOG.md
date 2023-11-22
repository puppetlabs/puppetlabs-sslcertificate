<!-- markdownlint-disable MD024 -->
# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](http://semver.org).

## [v5.0.1](https://github.com/puppetlabs/puppetlabs-sslcertificate/tree/v5.0.1) - 2023-11-22

[Full Changelog](https://github.com/puppetlabs/puppetlabs-sslcertificate/compare/v5.0.0...v5.0.1)

## [v5.0.0](https://github.com/puppetlabs/puppetlabs-sslcertificate/tree/v5.0.0) - 2023-08-17

[Full Changelog](https://github.com/puppetlabs/puppetlabs-sslcertificate/compare/v4.1.0...v5.0.0)

### Changed
- Drop Puppet 6 support [#119](https://github.com/puppetlabs/puppetlabs-sslcertificate/pull/119) ([bastelfreak](https://github.com/bastelfreak))

### Added

- Allow stdlib 8.0.0 [#112](https://github.com/puppetlabs/puppetlabs-sslcertificate/pull/112) ([smortex](https://github.com/smortex))

## [v4.1.0](https://github.com/puppetlabs/puppetlabs-sslcertificate/tree/v4.1.0) - 2020-01-14

[Full Changelog](https://github.com/puppetlabs/puppetlabs-sslcertificate/compare/v4.0.0...v4.1.0)

### Added

- Allow `puppetlabs/stdlib` 6.x [#93](https://github.com/puppetlabs/puppetlabs-sslcertificate/pull/93) ([cubiclelord](https://github.com/cubiclelord))

### Fixed

- ISSUE-99: Add note explaining redoubled backslashes. [#100](https://github.com/puppetlabs/puppetlabs-sslcertificate/pull/100) ([pillarsdotnet](https://github.com/pillarsdotnet))

## [v4.0.0](https://github.com/puppetlabs/puppetlabs-sslcertificate/tree/v4.0.0) - 2019-05-02

[Full Changelog](https://github.com/puppetlabs/puppetlabs-sslcertificate/compare/v3.4.0...v4.0.0)

### Changed
- modulesync 2.5.1 & drop Puppet 4 [#88](https://github.com/puppetlabs/puppetlabs-sslcertificate/pull/88) ([bastelfreak](https://github.com/bastelfreak))

### Added

- modulesync 2.2.0 and allow puppet 6.x [#85](https://github.com/puppetlabs/puppetlabs-sslcertificate/pull/85) ([bastelfreak](https://github.com/bastelfreak))
- Add wildcard & bypass Intermediate Store support [#84](https://github.com/puppetlabs/puppetlabs-sslcertificate/pull/84) ([arthurbarton](https://github.com/arthurbarton))

### Fixed

- Checks if the certificate is installed without creating an object [#70](https://github.com/puppetlabs/puppetlabs-sslcertificate/pull/70) ([crmezzet](https://github.com/crmezzet))

## [v3.4.0](https://github.com/puppetlabs/puppetlabs-sslcertificate/tree/v3.4.0) - 2018-09-07

[Full Changelog](https://github.com/puppetlabs/puppetlabs-sslcertificate/compare/v3.3.0...v3.4.0)

### Added

- allow puppetlabs/stdlib 5.x [#80](https://github.com/puppetlabs/puppetlabs-sslcertificate/pull/80) ([bastelfreak](https://github.com/bastelfreak))

## [v3.3.0](https://github.com/puppetlabs/puppetlabs-sslcertificate/tree/v3.3.0) - 2018-02-13

[Full Changelog](https://github.com/puppetlabs/puppetlabs-sslcertificate/compare/v3.2.0...v3.3.0)

### Added

- Don't store the PS1 scripts [#66](https://github.com/puppetlabs/puppetlabs-sslcertificate/pull/66) ([natemccurdy](https://github.com/natemccurdy))
- Make the password parameter optional [#65](https://github.com/puppetlabs/puppetlabs-sslcertificate/pull/65) ([rnelson0](https://github.com/rnelson0))

## [v3.2.0](https://github.com/puppetlabs/puppetlabs-sslcertificate/tree/v3.2.0) - 2017-11-20

[Full Changelog](https://github.com/puppetlabs/puppetlabs-sslcertificate/compare/v3.1.0...v3.2.0)

### Added

- bump puppet version dependency to >= 4.7.1 < 6.0.0 [#59](https://github.com/puppetlabs/puppetlabs-sslcertificate/pull/59) ([bastelfreak](https://github.com/bastelfreak))

## [v3.1.0](https://github.com/puppetlabs/puppetlabs-sslcertificate/tree/v3.1.0) - 2017-09-17

[Full Changelog](https://github.com/puppetlabs/puppetlabs-sslcertificate/compare/v3.0.0...v3.1.0)

## [v3.0.0](https://github.com/puppetlabs/puppetlabs-sslcertificate/tree/v3.0.0) - 2017-06-26

[Full Changelog](https://github.com/puppetlabs/puppetlabs-sslcertificate/compare/v2.2.0...v3.0.0)

### Added

- Set mode to 0600 on sensitive scripts [#54](https://github.com/puppetlabs/puppetlabs-sslcertificate/pull/54) ([roidelapluie](https://github.com/roidelapluie))
- New argument to set exportability of the certificate [#46](https://github.com/puppetlabs/puppetlabs-sslcertificate/pull/46) ([ricardogaspar2](https://github.com/ricardogaspar2))

### Fixed

- Fixing typo [#50](https://github.com/puppetlabs/puppetlabs-sslcertificate/pull/50) ([thirumoorthir](https://github.com/thirumoorthir))

## [v2.2.0](https://github.com/puppetlabs/puppetlabs-sslcertificate/tree/v2.2.0) - 2017-02-11

[Full Changelog](https://github.com/puppetlabs/puppetlabs-sslcertificate/compare/v2.1.1...v2.2.0)

### Fixed

- Fix references to `sslcert` [#30](https://github.com/puppetlabs/puppetlabs-sslcertificate/pull/30) ([alexjfisher](https://github.com/alexjfisher))

## [v2.1.1](https://github.com/puppetlabs/puppetlabs-sslcertificate/tree/v2.1.1) - 2015-03-24

[Full Changelog](https://github.com/puppetlabs/puppetlabs-sslcertificate/compare/v2.0.2...v2.1.1)

## [v2.0.2](https://github.com/puppetlabs/puppetlabs-sslcertificate/tree/v2.0.2) - 2014-10-13

[Full Changelog](https://github.com/puppetlabs/puppetlabs-sslcertificate/compare/v2.0.1...v2.0.2)

## [v2.0.1](https://github.com/puppetlabs/puppetlabs-sslcertificate/tree/v2.0.1) - 2014-10-13

[Full Changelog](https://github.com/puppetlabs/puppetlabs-sslcertificate/compare/v1.0.1...v2.0.1)

## [v1.0.1](https://github.com/puppetlabs/puppetlabs-sslcertificate/tree/v1.0.1) - 2014-10-13

[Full Changelog](https://github.com/puppetlabs/puppetlabs-sslcertificate/compare/v2.1.0...v1.0.1)

## [v2.1.0](https://github.com/puppetlabs/puppetlabs-sslcertificate/tree/v2.1.0) - 2014-10-13

[Full Changelog](https://github.com/puppetlabs/puppetlabs-sslcertificate/compare/v2.0.0...v2.1.0)

## [v2.0.0](https://github.com/puppetlabs/puppetlabs-sslcertificate/tree/v2.0.0) - 2014-04-16

[Full Changelog](https://github.com/puppetlabs/puppetlabs-sslcertificate/compare/v1.0.0...v2.0.0)

## [v1.0.0](https://github.com/puppetlabs/puppetlabs-sslcertificate/tree/v1.0.0) - 2014-03-12

[Full Changelog](https://github.com/puppetlabs/puppetlabs-sslcertificate/compare/67919d208e50ac9156ecda32e09c4efc5ca6fca8...v1.0.0)
