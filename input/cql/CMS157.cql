library CMS157

/* CMS157v10: Oncology: Medical and Radiation - Pain Intensity Quantified */

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon called FC
include AlphoraCommon called AC
include CMSConcepts called Cx
include SDE called SDE

parameter "Measurement Period" default Interval[@2018-01-01T00:00:00.000, @2020-01-01T00:00:00.000)
context Patient

//define "Initial Population":

//Patient has Cancer
define "Patient Has Cancer":
(AC.QualifiedConditions([Condition: Cx."Cancer"])) Cancer 
    where FC.ToPrevalenceInterval(Cancer) overlaps "Measurement Period"

//Chemo 31 days Prior or After Measurement Period


//Face to Face or Telehealth Encounter
