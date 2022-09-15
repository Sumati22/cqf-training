library CMS68

/* CMS68v9: Documentation of Current Medications in the Medical Record */

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon called FC
include AlphoraCommon called AC
include CMSConcepts called Cx
include SDE called SDE

parameter "Measurement Period" default Interval[@2020-01-01T00:00:00.000, @2021-01-01T00:00:00.000)
context Patient

/* Supplemental Data Elements */
define "SDE Sex":
  SDE."SDE Sex"

define "SDE Race":
  SDE."SDE Race"

define "SDE Ethnicity":
  SDE."SDE Ethnicity"

define "SDE Payer":
  SDE."SDE Payer"

/* Population Criteria */
define "Initial Population":
  exists "Qualifying Encounters During Measurement Period"
    and "Patient Age 18 or Older at Start of Measurement Period"

define "Denominator":
  "Initial Population"

define "Numerator":
  exists "Medications Documented During Qualifying Encounter"

define "Denominator Exception":
  exists "Medications Not Documented for Medical Reason"

/* Initial Population */
define "Qualifying Encounters During Measurement Period":
  (AC.QualifiedEncounters([Encounter: Cx."Encounter to Document Medications"])) QualifiedEncounter
    where QualifiedEncounter.period during "Measurement Period"

define "Patient Age 18 or Older at Start of Measurement Period":
  AgeInYearsAt(start of "Measurement Period") >= 18

/* Numerator */
define "Medications Documented During Qualifying Encounter":
  (AC.QualifiedProcedures([Procedure: Cx."Current Medications Documented"])) Documentation
    with "Qualifying Encounters During Measurement Period" QualifiedEncounter
      such that FC.ToInterval(Documentation.performed) during QualifiedEncounter.period

/* Denominator Exception*/
define "Medications Not Documented for Medical Reason":
  (AC.NotDoneProcedures([Procedure: Cx."Current Medications Documented"])) NoDocumentation
    let NotDoneRecorded: AC.ResourceNotDoneRecorded(NoDocumentation).value as dateTime
    with "Qualifying Encounters During Measurement Period" QualifiedEncounter
     such that FC.ToInterval(NotDoneRecorded) during QualifiedEncounter.period
    where NoDocumentation.statusReason in Cx."Medical or Other Reason Not Done"
