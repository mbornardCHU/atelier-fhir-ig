Instance: PatientExample2
InstanceOf: PatientProfile
Title: "Exemple Patient 002 - Meriot Tiphaine"
Usage: #example

* identifier[ipp].system = "https://chu-ISIS.fr/fhir/sid/ipp"
* identifier[ipp].value = "789012"
* identifier[ipp].type = http://terminology.hl7.org/CodeSystem/v2-0203#MR

* identifier[ins].system = "urn:oid:1.2.250.1.213.1.4.8"
* identifier[ins].value = "2850675431234"
* identifier[ins].type = http://terminology.hl7.org/CodeSystem/v2-0203#NI

* name.use = #official
* name.family = "Meriot"
* name.given = "Tiphaine"
* birthDate = "1985-07-22"
* gender = #female
* telecom.system = #phone
* telecom.value = "+33612345678"
* telecom.use = #mobile

// Nationalité
* extension[nationalite].valueCodeableConcept = CSAllNationalities#BE "Belge"

// Médecin traitant
* generalPractitioner.display = "Dr. Dupont Marie"