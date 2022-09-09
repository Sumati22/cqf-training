library Stratefiers

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon called FC
include AlphoraCommon called AC

parameter "Measurement Period" default Interval[@2020-01-01T00:00:00.000, @2021-01-01T00:00:00.000)
context Patient


/*

Age Groups:

  add 3 startifers for age group
  age <29
  age >29 and age < 59
  age > 59

*/

// Age Group
define "Age Group":
  if AgeInYearsAt(start of "Measurement Period") <= 29 then 'Age is <= 29 years.'
  else if (
    AgeInYearsAt(start of "Measurement Period") > 29
    and AgeInYearsAt(start of "Measurement Period") < 59
  ) then 'Age is between 29-59 years.'
  else if AgeInYearsAt(start of "Measurement Period") >= 59 then 'Age is >= 59 years.'
  else ''
