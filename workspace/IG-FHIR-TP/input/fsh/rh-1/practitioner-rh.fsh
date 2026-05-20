Profile: RHPractitioner
Parent: Practitioner
Id: rh-practitioner
Title: "RH Practitioner"
Description: "Profil FHIR d'un soignant géré par les ressources humaines."

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open

* identifier contains
    idmed 1..1 and
    RPPS 1..1

* identifier[idmed].value 1..1

* identifier[RPPS].system = "RPPS"
* identifier[RPPS].value 1..1

* name 1..1
* name.given 1..*
* telecom 1..*
* address 0..*
* gender 1..1
* gender from AdministrativeGender
* birthDate 0..1
* photo 1..1
* communication 1..1
* qualification 1..1

* qualification.identifier 1..1
* qualification.code 1..1
* qualification.period 1..1

* qualification.code from GradeValueSet (required)

