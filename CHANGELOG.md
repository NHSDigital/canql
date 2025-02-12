## [Unreleased]
### Fixed
* Restrict treetop gem dependency

## 6.0.2 / 2024-11-18
### Fixed
* Support Ruby 3.2, 3.3, Rails 7.1, 7.2 and 8.0. Drop support for Ruby 3.0, Rails 6.1

## 6.0.1 / 2024-10-14
### Fixed
* Code only misspelling of existence
* Code only misspelling of modifier
* Code only misspelling of number
* Code only misspelling of acceptance
* Moved development dependencies to Gem files

## 6.0.0 / 2024-09-30
### Changed
* Changed the hes event filter to align with other new event filter
### Added
* Added event filters for birth, death, pregnancy loss and MSDS
* Added 'number of fetuses in early pregnancy' to field existence modifier
* Removed 'CODING_CLINIC' & 'REG_GROUP' actions from the action filter
* Added 'BADGER_CHECKED', 'DELETE', 'FASP_CATEGORISATION', 'MSDS_SENT', 'RARE_DISEASE_TEAM', 'REG_CODING_FORUM' & 'SOURCES_CHECKED' actions to the action filter

## 5.9.0 / 2023-01-17
* Added 'other' option to anomaly screening status filter (#90)

## 5.8.1 / 2022-12-08
* Drop support for Ruby 2.6
* Support Ruby 3.1, Rails 7.0
* Replace Public Health England naming with NHS Digital

## 5.8.0 / 2022-07-18
* Added new 'badger_search' registration action type filter (#86)

## 5.7.1 / 2021-10-11
### Patched
* Corrected issue where date related tests failed on some ruby version (#83)

## 5.7.0 / 2021-09-16
* Added new 'fasp' and 'fasp amber and green' case / patient / anomaly categoryfilters (#78)
* Added new HES, BIOCHEM and USS unprocessed record filters (#79)

## 5.6.0 / 2021-03-16
### Added
* Add new CA Death option to the unprocessed record filter (#75)

## 5.5.0 / 2021-03-16
### Added
* Add HES event filter (#72)

## 5.4.0 / 2021-03-08
### Added
* Add 'pending data' option to the anomaly screening status filter (#69)

## 5.3.0 / 2021-03-05
### Added
* Added new FASP case RAG rating filters (#66)

## 5.2.0 / 2021-03-04
### Added
* Added new FASP anomaly RAG rating filters (#63)

## 5.1.0 / 2021-01-25
### Added
* Added new filters for test acceptance requirments (#59)

## 5.0.0 / 2021-01-19
### Changed
* Changed the values of registry to use registry name rather than codes and added new supra-region options (#54)

### Added
* Added fetal medicine and dating options to the test group filter (#50)
* Added new gestation at delivery and booking date to case field existance filter (#52)

## 4.4.1 / 2021-01-13
### Fixed
* Relax constraints to support Rails 6.x

## 4.4.0 / 2020-07-08
### Added
* Added filter for missing and supplied required test result groups (#47)

## 4.3.0 / 2020-06-10
### Added
* Added additional field existance options (#45)

## 4.2.0 / 2020-03-25
### Added
* Added additional EUROCAT category filters for RAG combination

## 4.1.0 / 2020-03-19
### Added
* Added filters for EUROCAT RAG rating (#39)

## 4.0.1 / 2019-10-29
### Fixed
* Relax `chronic` dependency

## 4.0.0 / 2019-09-06
### Changed
* Added case filters for delivery and booking postcode fields and removed all simple postcode field filters (#36)

### Added
* Added fasp and fasp plus code groups (#37)

## 3.0.0 / 2019-06-04
### Changed
* Added new branch of CANQL for querying all patient not just child patients - modifies DIR (#29)

## 2.10.0 / 2019-05-29
### Added
* Add filter for processing region (#32)

## 2.9.0 / 2019-05-14
### Added
* Add filter for processing date for unprocessed records (#28)

## 2.8.0 / 2019-04-09
### Added
* Added filtering by anomaly screening status (#25)
* Added anomaly screening status to field existance list (#26)

## 2.7.0 / 2019-03-21
### Added
* Added support for NIPT, RD_DEATH and UMUM batch types (#23)

## 2.6.0 / 2019-03-12
### Added
* Added the ability to limit cases to primary or alias patients (#20)
* Added support for ENOTE2, BADGER and UCYTO batched types (#21)

## 2.5.0 / 2019-01-25
### Added
* Added the abiltity to filter actions by trust as well as hospital (#18)
* Added the abiltity to filter cases by booking and delivery hospital & trust (#18)
### Fixed
* Support Ruby 2.6 - minimum is now 2.4

## 2.4.0 / 2018-07-19
### Added
* add ability to filter by genetic tests (#17)

## 2.3.0 / 2018-06-08
### Added
* Added action and ebr clauses for mother patients (#16)

## 2.2.0 / 2018-06-05
### Added
* Added EDD and booking hospital to missing and populated field clause (#15)
