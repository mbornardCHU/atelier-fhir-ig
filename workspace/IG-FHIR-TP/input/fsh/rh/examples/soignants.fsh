Instance: MeredithGrey
InstanceOf: Soignant
Usage: #example
Title: "Dr. Meredith Grey — Chirurgienne générale"
Description: "Exemple d'une chirurgienne générale avec deux rôles : CHU et cabinet libéral."

* active = true
* identifier[RPPS].use    = #official
* identifier[RPPS].system = "urn:oid:1.2.250.1.71.4.2.1"
* identifier[RPPS].value  = "10000000001"
* name[0].use      = #official
* name[0].prefix   = "Dr."
* name[0].family   = "Grey"
* name[0].given[0] = "Meredith"
* gender    = #female
* birthDate = "1978-09-27"
* telecom[0].system = #phone
* telecom[0].value  = "+33123456789"
* telecom[0].use    = #work
* telecom[1].system = #email
* telecom[1].value  = "meredith.grey@grey-sloan.fr"
* telecom[1].use    = #work
* address[0].use        = #work
* address[0].line[0]    = "1 Rue du Grey Sloan Memorial"
* address[0].city       = "Paris"
* address[0].postalCode = "75015"
* address[0].country    = "FR"
* qualification[0].code.text          = "Chirurgie Générale"
* qualification[0].period.start       = "2005-06-30"
* qualification[0].issuer.display     = "Université Paris Cité"
* communication[0].coding[0].system  = "urn:ietf:bcp:47"
* communication[0].coding[0].code    = #fr
* communication[0].coding[0].display = "French"
* communication[1].coding[0].system  = "urn:ietf:bcp:47"
* communication[1].coding[0].code    = #en
* communication[1].coding[0].display = "English"


Instance: AlexKarev
InstanceOf: Soignant
Usage: #example
Title: "Dr. Alex Karev — Chirurgien pédiatrique"
Description: "Exemple d'un chirurgien pédiatrique avec un seul rôle."

* active = true
* identifier[RPPS].use    = #official
* identifier[RPPS].system = "urn:oid:1.2.250.1.71.4.2.1"
* identifier[RPPS].value  = "10000000002"
* name[0].use      = #official
* name[0].prefix   = "Dr."
* name[0].family   = "Karev"
* name[0].given[0] = "Alex"
* gender    = #male
* birthDate = "1980-05-16"
* telecom[0].system = #phone
* telecom[0].value  = "+33123456790"
* telecom[0].use    = #work
* address[0].use        = #work
* address[0].line[0]    = "1 Rue du Grey Sloan Memorial"
* address[0].city       = "Paris"
* address[0].postalCode = "75015"
* address[0].country    = "FR"
* qualification[0].code.text      = "Chirurgie Pédiatrique"
* qualification[0].period.start   = "2007-06-30"
* qualification[0].issuer.display = "Université Paris Cité"
* communication[0].coding[0].system  = "urn:ietf:bcp:47"
* communication[0].coding[0].code    = #fr
* communication[0].coding[0].display = "French"


Instance: MirandaBailey
InstanceOf: Soignant
Usage: #example
Title: "Dr. Miranda Bailey — Chirurgienne générale & Chef de service"
Description: "Exemple d'une chirurgienne générale occupant deux rôles : praticienne au bloc et chef de service."

* active = true
* identifier[RPPS].use    = #official
* identifier[RPPS].system = "urn:oid:1.2.250.1.71.4.2.1"
* identifier[RPPS].value  = "10000000003"
* name[0].use      = #official
* name[0].prefix   = "Dr."
* name[0].family   = "Bailey"
* name[0].given[0] = "Miranda"
* gender    = #female
* birthDate = "1975-07-12"
* telecom[0].system = #phone
* telecom[0].value  = "+33123456791"
* telecom[0].use    = #work
* telecom[1].system = #email
* telecom[1].value  = "miranda.bailey@grey-sloan.fr"
* telecom[1].use    = #work
* address[0].use        = #work
* address[0].line[0]    = "1 Rue du Grey Sloan Memorial"
* address[0].city       = "Paris"
* address[0].postalCode = "75015"
* address[0].country    = "FR"
* qualification[0].code.text      = "Chirurgie Générale"
* qualification[0].period.start   = "2001-06-30"
* qualification[0].issuer.display = "Université Paris Cité"
* qualification[1].code.text      = "DU Management Hospitalier"
* qualification[1].period.start   = "2010-01-01"
* qualification[1].issuer.display = "EHESP"
* communication[0].coding[0].system  = "urn:ietf:bcp:47"
* communication[0].coding[0].code    = #fr
* communication[0].coding[0].display = "French"
* communication[1].coding[0].system  = "urn:ietf:bcp:47"
* communication[1].coding[0].code    = #en
* communication[1].coding[0].display = "English"