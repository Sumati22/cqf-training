library NQFConcepts

using FHIR version '4.0.1'

/* Terminology */

/* NQF0326: Advance Care Plan */
//Initial Population / Denominator
valueset "Advance Care Visits": 'http://content.alphora.com/fhir/dqm/ValueSet/AdvanceCareVisits'
valueset "Place Of Service, Emergency Room": 'http://content.alphora.com/fhir/dqm/ValueSet/PlaceOfServiceEmergencyRoom'

//Denominator Exclusion
valueset "Patient Received Hospice Services": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1116.472'

//Numerator / Denominator Exception
valueset "Advance Care Plan": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1116.468'


/* NQF0383: Oncology: Medical and Radiation – Plan of Care for Pain */
// Initial Population / Denominator
valueset "Cancer": 'http://content.alphora.com/fhir/dqm/ValueSet/CancerDiagnosis'
valueset "Chemotherapy Administration": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.2.1080'
valueset "Patient Encounter": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1116.367'
valueset "Standardized Pain Assessment Tool": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.1028'
valueset "Pain Assessed, Pain Present": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1116.444'
valueset "Radiation Treatment Management": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.2.1071'

//Numerator / Denominator Exception
valueset "Plan Of Care For Pain": 'http://content.alphora.com/fhir/dqm/ValueSet/PlanOfCareForPain'


/* NQF0383 / NQF0326 */

//Denominator Exception
valueset "Action Not Performed, No Reason Given": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1116.381'