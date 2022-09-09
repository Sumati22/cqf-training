library VituityConcepts

using FHIR version '4.0.1'

/* Terminology */

/* Shared --- Smile.Vituity Pilot Measures */
/* Initial Population */
valueset "Emergency Patient Encounter": 'http://content.alphora.com/fhir/dqm/ValueSet/EmergencyPatientEncounter'
valueset "Discharge Disposition": 'http://terminology.hl7.org/ValueSet/encounter-discharge-disposition'

/* Denominator */
valueset "Acute Noncomplex Low Back pain": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1106.20'


/* ACEP52: Appropriate Emergency Department Utilization of Lumbar Spine Imaging for Atraumatic Low Back Pain */
/* Initial Population */
valueset "Emergency Care":  'http://content.alphora.com/fhir/dqm/ValueSet/EmergencyCare'

/* Denominator */
valueset "MRI Low Back and CT Low Back": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1106.21'

/* Numerator */
valueset "Lumbar Spine CT or MRI Indications": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1106.22'


/* ECPR46: Avoidance of Opiate Prescriptions for Low Back Pain or Migraines */
/* Denominator */
valueset "Migraine": 'http://content.alphora.com/fhir/dqm/ValueSet/Migraine'

/* Numerator */
// Opioid Medications
valueset "Low Back Opioid Medications": 'http://content.alphora.com/fhir/dqm/ValueSet/LowBackOpioidMedications'

/* Denominator Exception */
valueset "Competing Opiate Conditions": 'http://content.alphora.com/fhir/dqm/ValueSet/CompetingOpioidConditions'


/* MIPS116: Avoidance of Antibiotic Treatment for Acute Bronchitis/Bronchiolitis */
// Initial Population / Denominator
valueset "Bronchitis Patient Encounters": 'http://content.alphora.com/fhir/dqm/ValueSet/BronchitisPatientEncounters'
valueset "Acute Bronchitis/Bronchiolitis": 'http://content.alphora.com/fhir/dqm/ValueSet/AcuteBronchitisBronchiolitis'

// Denominator Exclusion
valueset "Hospice Services": 'http://content.alphora.com/fhir/dqm/ValueSet/HospiceServices'
valueset "Inpatient Admission": 'http://content.alphora.com/fhir/dqm/ValueSet/InpatientAdmission'
valueset "Competing Antibiotics Conditions": 'http://content.alphora.com/fhir/dqm/ValueSet/CompetingAntibioticsConditions'

// Denominator Exclusion / Numerator
valueset "Antibiotics": 'http://content.alphora.com/fhir/dqm/ValueSet/Antibiotics'


/* MIPS331: Adult Sinusitis: Antibiotic Prescribed for Acute Viral Sinusitis (Overuse) */
// Initial Population / Denominator
valueset "Sinusitis Patient Encounters": 'http://content.alphora.com/fhir/dqm/ValueSet/SinusitisPatientEncounters'
valueset "Acute Sinusitis/Rhinosinusitis": 'http://content.alphora.com/fhir/dqm/ValueSet/AcuteSinusitis'

// Numerator / Denominator Exception
valueset "Systemic Antibiotics": 'http://content.alphora.com/fhir/dqm/ValueSet/SystemicAntibiotics'

// Denominator Exception
valueset "Competing Systemic Antibiotics Conditions": 'http://content.alphora.com/fhir/dqm/ValueSet/CompetingSystemicAntibioticsConditions'
