Profile: Soignant
Parent: Practitioner
Description: "A profile of FHIR R4 Practitioner for the French healthcare context."
* active         1..1 MS
* identifier     1..1 MS
* name           1..* MS
* name.family    1..1 MS
* name.given     1..* MS
* gender         1..1 MS
* birthDate      1..1 MS
* telecom        1..* MS
* address        MS
* qualification  MS
* communication  MS

// Slicing RPPS sur identifier
* identifier ^slicing.discriminator[0].type = #value
* identifier ^slicing.discriminator[0].path = "system"
* identifier ^slicing.rules = #open

* identifier contains RPPS 1..1 MS
* identifier[RPPS].use    = #official
* identifier[RPPS].system = "urn:oid:1.2.250.1.71.4.2.1"
* identifier[RPPS].value  1..1 MS

* extension contains
    PractitionerNationality named nationality 0..1 MS and
    PractitionerBirthPlace named birthPlace 0..1 MS