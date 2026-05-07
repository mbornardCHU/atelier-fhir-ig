Extension: LocationEnvironmentControlExtension
Id: location-environment-control-extension
Title: "Extension Contrôle Environnemental salles"
Description: "Extension FHIR pour représenter les contrôles environnementaux d'une salle dans la gestion du patrimoine d'un établissement de soins."
Context: Location

* ^status = #draft

* value[x] only CodeableConcept 
* valueCodeableConcept from VSLocationEnvironmentControls (required)