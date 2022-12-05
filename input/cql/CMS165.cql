library CMS165v10
/* CMS165v10: Controlling High Blood Pressure  */

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon called FC
include AlphoraCommon called AC
include CMSConcepts called Cx
include SDE called SDE

parameter "Measurement Period" default Interval[@2019-01-01T00:00:00.000, @2019-12-31T00:00:00.000)
context Patient

/* Population Criteria */
define "Initial Population":
    exists "Essential Hypertension Diagnosis"
    and "Adult Outpatient or Telehealth Encounter"
    and "Patient age between 18 and 85" 

define "Denominator":
"Initial Population" 
/*
define "Numerator":
  exists "Blood Pressure Under Control"
/*
define "Denominator Exclusion":
  exists "Has Hospice"
  or exists "Renal Disease Encounter" 
  or exists "Renal Disease Procedure" 
  or exists "Pregancy or Renal Diagnosis Exclusions" 
  or exists "Criteria Indicating Frailty Where Patient Age > 81" 
  or exists "Two Outpatient Encounters With Advanced Illness where Patient Age > 66" 
  or exists "Inpatient Encounter With Advanced Illness Where Patient Age > 66" 
  or exists "Dementia Medications In Year Before Or During Measurement Period Where Patient Age > 66" 
  or exists "Palliative Care In The Measurement Period" 

  /* Initial Population */
define "Essential Hypertension Diagnosis":
  (AC.QualifiedConditions([Condition: Cx."Essential Hypertension"])) EssentialHypertension 
    where FC.ToPrevalenceInterval(EssentialHypertension) overlaps Interval[start of "Measurement Period", start of "Measurement Period" + 6 months) 

define "Patient age between 18 and 85":
    AgeInYearsAt(start of "Measurement Period") in Interval[18, 85]

define "Adult Outpatient Encounter":
  (AC.QualifiedEncounters([Encounter: Cx."Office Visit"])
  union (AC.QualifiedEncounters([Encounter: Cx."Annual Wellness Visit"]))
  union (AC.QualifiedEncounters([Encounter: Cx."Preventative Care Services- Established Office VIsit- 18 and Up"]))
  union (AC.QualifiedEncounters([Encounter: Cx."Preventative Care Services- Initial Office VIsit- 18 and Up"]))
  union (AC.QualifiedEncounters([Encounter: Cx."Home Healthcare Services"]))
  union (AC.QualifiedEncounters([Encounter: Cx."Telephone Visits"]))
  union (AC.QualifiedEncounters([Encounter: Cx."Online Assessments"]))
  ) OutpatientEncounter 
  where OutpatientEncounter.period during "Measurement Period"