Profile: PatientProfile
Parent: https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient
Id: bureau-entrees-patient
Title: "Profil Patient - Bureau des Entrées"
Description: "Profil patient pour le bureau des entrées hospitalier, basé sur le FRCore français."

* ^status = #draft
* ^publisher = "Bureau des Entrées"

// Identité obligatoire
* name 1..* MS
* birthDate 1..1 MS
* gender 1..1 MS

// Identifiants : IPP obligatoire, INS optionnel
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open

* identifier contains
    ipp 1..1 MS and
    ins 0..1 MS

* identifier[ipp].system 1..1
* identifier[ipp].system = "https://chu-ISIS.fr/fhir/sid/ipp"
* identifier[ipp].value 1..1
* identifier[ipp].type 1..1
* identifier[ipp].type = http://terminology.hl7.org/CodeSystem/v2-0203#MR "Medical record number"

* identifier[ins].system 1..1
* identifier[ins].system = "urn:oid:1.2.250.1.213.1.4.8"
* identifier[ins].value 1..1
* identifier[ins].type 1..1
* identifier[ins].type = http://terminology.hl7.org/CodeSystem/v2-0203#NI "National unique individual identifier"

// Coordonnées de contact
* telecom MS
* address MS

// Personne de confiance
* contact MS

// Photo interdite
* photo 0..0

* extension contains PatientExtension named nationalite 0..1 MS
* extension[nationalite].valueCodeableConcept 1..1
* extension[nationalite].valueCodeableConcept from PatientValueSet (required)

* generalPractitioner MS
* generalPractitioner only Reference(https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-practitioner)
