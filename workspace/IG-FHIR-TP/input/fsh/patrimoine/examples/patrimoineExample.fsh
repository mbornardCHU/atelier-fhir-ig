Instance: SalleExamenExample
InstanceOf: PatrimoineLocation
Title: "Exemple de salle d'examen pour la gestion du patrimoine d'un établissement de soins"
Description: "Instance exemple d'une salle d'examen dans un établissement de santé"

* identifier[0].system = "http://hospital.example.org/locations"
* identifier[0].value = "LOC-EXAM-42"
* identifier[1].system = "http://hospital.example.org/locations"
* identifier[1].value = "E42"

* status = #active
* name = "Salle d'examen 42 - Cardiologie"
* type = #SLE "Salle d'examen"

* telecom[0].system = #phone
* telecom[0].value = "+33 1 23 45 67 89"
* telecom[0].use = #work

* address
  * use = #work
  * type = #both
  * line = "12 Rue de la Santé"
  * city = "Castres"
  * postalCode = "81100"
  * country = "FR"

* managingOrganization = Reference(Organization/hospital-example)

* partOf = Reference(Location/etage-2-example)

* hoursOfOperation[0].daysOfWeek = #mon
* hoursOfOperation[0].daysOfWeek = #tue
* hoursOfOperation[0].daysOfWeek = #wed
* hoursOfOperation[0].daysOfWeek = #thu
* hoursOfOperation[0].daysOfWeek = #fri
* hoursOfOperation[0].allDay = false
* hoursOfOperation[0].openingTime = "08:00:00"
* hoursOfOperation[0].closingTime = "18:00:00"

* extension[environmentControl][0].valueCodeableConcept = CSLocationEnvironmentControls#temperature "Temperature Control"
* extension[environmentControl][1].valueCodeableConcept = CSLocationEnvironmentControls#humidity "Humidity rate Control"
* extension[environmentControl][2].valueCodeableConcept = CSLocationEnvironmentControls#air "Air Quality Control"