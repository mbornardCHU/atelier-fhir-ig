Profile: PatrimoineLocation
Id: patrimoine-location
Title: "Patrimoine Location Profile"
Parent: Location
Description: "Profil FHIR des salles pour la gestion du patrimoine d'un établissement de soins."

* identifier 0..* MS
* status 1..1 MS
* name 1..1 MS
* type 1..1 MS
* telecom 0..* MS
* address 0..1 MS
* managingOrganization 0..1 MS
* partOf 0..1 MS
* hoursOfOperation 0..* MS

* type from VSLocationTypes (required)
* status from http://hl7.org/fhir/ValueSet/location-status (required)