Extension: PatientExtension
Id: PatientExtension
Title: Nationalité
Description: Extension pour indiquer la nationalité du patient
Context: Patient

*^status = #active

* value[x] only CodeableConcept
* valueCodeableConcept from PatientValueSet (required)
* valueCodeableConcept ^short = "nationality"
* valueCodeableConcept ^definition = "La nationalité, indiquée à l'aide d'un code de la liste des nationalités."