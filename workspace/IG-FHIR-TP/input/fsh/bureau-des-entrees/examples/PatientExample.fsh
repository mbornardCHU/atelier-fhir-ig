Instance: PatientExample
InstanceOf: PatientProfile
Title: "Exemple Patient 001 - Sarkissian Sara"
Usage: #example

* identifier[ipp].system = "https://chu-ISIS.fr/fhir/sid/ipp"
* identifier[ipp].value = "123456"

* name.use = #official
* name.family = "Sarkissian"
* name.given = "Sara"
* birthDate = "1991-04-15"
* gender = #female
* address.line = "12 Rue des Lilas"
* address.city = "Toulouse"
* address.postalCode = "31000"
* address.country = "FR"

// Nationalité
* extension[nationalite].valueCodeableConcept = CSAllNationalities#FR "Française"

// Médecin traitant
* generalPractitioner.display = "Dr. Martin Jean"