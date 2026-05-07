Instance: BlocOperatoireExample
InstanceOf: PatrimoineLocation
Title: "Exemple de bloc opératoire avec contrôles environnementaux avancés"
Description: "Instance exemple d'un bloc opératoire dans un établissement de santé"

* identifier[0].system = "urn:oid:1.2.3.4.5.6.7"
* identifier[0].value = "BLOC-OP-03"
* identifier[1].system = "http://hospital.example.org/locations"
* identifier[1].value = "OP-ORTHO-3"

* status = #active
* name = "Bloc opératoire orthopédique n°3"
* type = #BLC "Bloc opératoire"

* telecom[0].system = #phone
* telecom[0].value = "+33 1 23 45 67 90"
* telecom[0].use = #work
* telecom[1].system = #email
* telecom[1].value = "bloc.ortho3@hospital.example.org"

* address
  * use = #work
  * type = #both
  * line = "12 Rue de la Santé, Étage -1"
  * city = "Paris"
  * postalCode = "75001"
  * country = "FR"

* managingOrganization = Reference(Organization/hospital-example)

* partOf = Reference(Location/bloc-central-example)

* hoursOfOperation[0].daysOfWeek = #mon
* hoursOfOperation[0].daysOfWeek = #tue
* hoursOfOperation[0].daysOfWeek = #wed
* hoursOfOperation[0].daysOfWeek = #thu
* hoursOfOperation[0].daysOfWeek = #fri
* hoursOfOperation[0].allDay = false
* hoursOfOperation[0].openingTime = "07:30:00"
* hoursOfOperation[0].closingTime = "20:00:00"
* hoursOfOperation[1].daysOfWeek = #sat
* hoursOfOperation[1].allDay = false
* hoursOfOperation[1].openingTime = "08:00:00"
* hoursOfOperation[1].closingTime = "14:00:00"

* extension[environmentControl][0].valueCodeableConcept = CSLocationEnvironmentControls#sterility "Sterility Environment Control"
* extension[environmentControl][1].valueCodeableConcept = CSLocationEnvironmentControls#pressure "Environment with pressure to prevents microparticles from entering"
* extension[environmentControl][2].valueCodeableConcept = CSLocationEnvironmentControls#temperature "Temperature Control"
* extension[environmentControl][3].valueCodeableConcept = CSLocationEnvironmentControls#humidity "Humidity rate Control"
* extension[environmentControl][4].valueCodeableConcept = CSLocationEnvironmentControls#air "Air Quality Control"