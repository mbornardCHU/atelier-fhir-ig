Instance: rh-practitioner-exemple-1
InstanceOf: RHPractitioner
Title: "Exemple RH Practitioner 1"
Description: "Exemple simple d'un médecin généraliste recruté par les ressources humaines."

* identifier[idmed].value = "MED001"
* identifier[RPPS].system = "RPPS"
* identifier[RPPS].value = "10000000001"

* name.family = "Martin"
* name.given = "Claire"

* telecom.system = #phone
* telecom.value = "0601020304"

* gender = #female
* birthDate = "1985-04-12"

* photo.contentType = #image/jpeg
* photo.url = "photo-claire-martin.jpg"

* communication.language.text = "Français"

* qualification.identifier.value = "QUAL001"
* qualification.code = CSGrade#medecin-generaliste "Médecin généraliste"
* qualification.period.start = "2024-01-01"


Instance: rh-practitioner-exemple-2
InstanceOf: RHPractitioner
Title: "Exemple RH Practitioner 2"
Description: "Exemple simple d'un chirurgien recruté par les ressources humaines."

* identifier[idmed].value = "MED002"
* identifier[RPPS].system = "RPPS"
* identifier[RPPS].value = "10000000002"

* name.family = "Durand"
* name.given = "Thomas"

* telecom.system = #email
* telecom.value = "thomas.durand@hopital.fr"

* address.line = "10 rue de l'Hôpital"
* address.city = "Toulouse"
* address.postalCode = "31000"
* address.country = "France"

* gender = #male
* birthDate = "1978-09-25"

* photo.contentType = #image/jpeg
* photo.url = "photo-thomas-durand.jpg"

* communication.language.text = "Français"

* qualification.identifier.value = "QUAL002"
* qualification.code = CSGrade#chirurgien "Chirurgien"
* qualification.period.start = "2023-09-01"