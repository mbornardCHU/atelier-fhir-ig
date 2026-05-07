// Extension : Lieu de naissance du soignant
Extension: PractitionerBirthPlace
Id: practitioner-birth-place
Title: "Practitioner Birth Place"
Description: "Lieu de naissance du soignant."
* ^context[0].type = #element
* ^context[0].expression = "Practitioner"
* value[x] only Address