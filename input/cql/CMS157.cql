library CMS157

/* CMS157v10: Oncology: Medical and Radiation - Pain Intensity Quantified */

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon called FC
include AlphoraCommon called AC
include CMSConcepts called Cx
include SDE called SDE

parameter "Measurement Period" default Interval[@2019-01-01T00:00:00.000, @2019-12-31T00:00:00.000)
context Patient

define "Initial Population 1":
 exists "Face to Face or Telehealth Encounter with Ongoing Chemo"

define "Denominator 1":
"Initial Population 1"

define "Numerator 1":
exists "Pain Assessed during Chemo Administration"

define "Initial Population 2":
exists "Radiation Treatment During Measurement Period and Patient has Cancer"

define "Denominator 2":
"Initial Population 2"

define "Numerator 2":
"Pain Assessed During Radiation Treatment"


//Patient has Cancer
define "Patient Has Cancer":
(AC.QualifiedConditions([Condition: Cx."Cancer"])) Cancer 
    where FC.ToPrevalenceInterval(Cancer) overlaps "Measurement Period"

define "Chemotherapy Period":
Interval[start of "Measurement Period" - 31 days, end of "Measurement Period" + 31 days]

//Chemo 31 days Prior or After Measurement Period
define "Chemo within 31Days Prior and After Measurement Period":
(AC.QualifiedProcedures([Procedure: Cx."Chemotherapy Administration"])) Chemo 
where FC.ToInterval(Chemo.performed) during "Chemotherapy Period"

//Face to Face or Telehealth Encounter
define "Face to Face or Telehealth Encounter with Ongoing Chemo":
(AC.QualifiedEncounters([Encounter: Cx."Office Visit"])) officeVisit
    with "Chemo within 31Days Prior and After Measurement Period" chemo
        such that (
            FC.ToInterval(chemo.performed) during Interval[start of officeVisit.period - 30 days, end of officeVisit.period + 30 days]
)
where officeVisit.period during "Measurement Period"

//Pain Assessed during Chemo Administration
define "Pain Assessed during Chemo Administration":
(AC.QualifiedObservations([Observation: Cx."Standardized Pain Assessment Tool"])) PainAssessed
 with "Face to Face or Telehealth Encounter with Ongoing Chemo" Encounter
    such that FC.ToInterval(PainAssessed.effective) during Encounter.period
    and PainAssessed.value is not null

//Radiation Treatment During Measurement Period
define "Radiation Treatment During Measurement Period and Patient has Cancer":
(AC.QualifiedProcedures([Procedure: Cx."Radiation Treatment Management"])) Radiation
where FC.ToInterval(Radiation.performed) during "Measurement Period"
and exists "Patient Has Cancer"

//Pain Assessed During Radiation Treatment
define "Pain Assessed During Radiation Treatment":
(AC.QualifiedObservations([Observation: Cx."Standardized Pain Assessment Tool"])) PainAssessed
 with "Radiation Treatment During Measurement Period and Patient has Cancer" Radiation
    such that FC.ToInterval(PainAssessed.effective) during FC.ToInterval(Radiation.performed)
    and PainAssessed.value is not null