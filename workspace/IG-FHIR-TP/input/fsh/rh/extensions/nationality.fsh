// Extension : Nationalité du soignant
Extension: PractitionerNationality
Id: practitioner-nationality
Title: "Practitioner Nationality"
Description: "Nationalité administrative du soignant."
* ^context[0].type = #element
* ^context[0].expression = "Practitioner"
* value[x] only CodeableConcept
* valueCodeableConcept from http://hl7.org/fhir/ValueSet/iso3166-1-2 (required)