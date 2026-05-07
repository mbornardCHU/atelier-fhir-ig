// Meredith Grey — Rôle 1
Instance: RoleMeredithGreySloan
InstanceOf: SoignantRole
Usage: #example
Title: "Dr. Meredith Grey — Rôle CHU Grey Sloan"
Description: "Meredith Grey en tant que chirurgienne générale au Grey Sloan Memorial Hospital, lundi mercredi vendredi."

* active = true
* period.start = "2005-09-01"

* practitioner = Reference(MeredithGrey)
* organization.display = "Grey Sloan Memorial Hospital — Paris"

* code[0].coding[0].system  = "https://mos.esante.gouv.fr/NOS/TRE_G15-ProfessionSante/FHIR/TRE-G15-ProfessionSante"
* code[0].coding[0].code    = #10
* code[0].coding[0].display = "Médecin"

* specialty[0].coding[0].system  = "https://mos.esante.gouv.fr/NOS/TRE_R38-SpecialiteOrdinale/FHIR/TRE-R38-SpecialiteOrdinale"
* specialty[0].coding[0].code    = #SM54
* specialty[0].coding[0].display = "Chirurgie générale"

* availableTime[0].daysOfWeek[0] = #mon
* availableTime[0].daysOfWeek[1] = #wed
* availableTime[0].daysOfWeek[2] = #fri
* availableTime[0].availableStartTime = "08:00:00"
* availableTime[0].availableEndTime   = "18:00:00"


// Meredith Grey — Rôle 2
Instance: RoleMeredithCabinet
InstanceOf: SoignantRole
Usage: #example
Title: "Dr. Meredith Grey — Rôle Cabinet libéral"
Description: "Meredith Grey en tant que consultante en chirurgie générale dans un cabinet libéral, mardi et jeudi."

* active = true
* period.start = "2018-01-15"

* practitioner = Reference(MeredithGrey)
* organization.display = "Cabinet Chirurgical Montparnasse — Paris"

* code[0].coding[0].system  = "https://mos.esante.gouv.fr/NOS/TRE_G15-ProfessionSante/FHIR/TRE-G15-ProfessionSante"
* code[0].coding[0].code    = #10
* code[0].coding[0].display = "Médecin"

* specialty[0].coding[0].system  = "https://mos.esante.gouv.fr/NOS/TRE_R38-SpecialiteOrdinale/FHIR/TRE-R38-SpecialiteOrdinale"
* specialty[0].coding[0].code    = #SM54
* specialty[0].coding[0].display = "Chirurgie générale"

* availableTime[0].daysOfWeek[0] = #tue
* availableTime[0].daysOfWeek[1] = #thu
* availableTime[0].availableStartTime = "09:00:00"
* availableTime[0].availableEndTime   = "14:00:00"


// Alex Karev
Instance: RoleAlexKarev
InstanceOf: SoignantRole
Usage: #example
Title: "Dr. Alex Karev — Rôle Chirurgien pédiatrique"
Description: "Alex Karev en tant que chirurgien pédiatrique au Grey Sloan Memorial Hospital, temps plein."

* active = true
* period.start = "2007-09-01"

* practitioner = Reference(AlexKarev)
* organization.display = "Grey Sloan Memorial Hospital — Paris"

* code[0].coding[0].system  = "https://mos.esante.gouv.fr/NOS/TRE_G15-ProfessionSante/FHIR/TRE-G15-ProfessionSante"
* code[0].coding[0].code    = #10
* code[0].coding[0].display = "Médecin"

* specialty[0].coding[0].system  = "https://mos.esante.gouv.fr/NOS/TRE_R38-SpecialiteOrdinale/FHIR/TRE-R38-SpecialiteOrdinale"
* specialty[0].coding[0].code    = #SM44
* specialty[0].coding[0].display = "Chirurgie infantile"

* availableTime[0].daysOfWeek[0] = #mon
* availableTime[0].daysOfWeek[1] = #tue
* availableTime[0].daysOfWeek[2] = #wed
* availableTime[0].daysOfWeek[3] = #thu
* availableTime[0].daysOfWeek[4] = #fri
* availableTime[0].availableStartTime = "07:30:00"
* availableTime[0].availableEndTime   = "19:00:00"


// Miranda Bailey — Rôle 1
Instance: RoleBaileyChirurgie
InstanceOf: SoignantRole
Usage: #example
Title: "Dr. Miranda Bailey — Rôle Chirurgienne générale"
Description: "Miranda Bailey en tant que chirurgienne générale au Grey Sloan Memorial Hospital."

* active = true
* period.start = "2001-09-01"

* practitioner = Reference(MirandaBailey)
* organization.display = "Grey Sloan Memorial Hospital — Paris"

* code[0].coding[0].system  = "https://mos.esante.gouv.fr/NOS/TRE_G15-ProfessionSante/FHIR/TRE-G15-ProfessionSante"
* code[0].coding[0].code    = #10
* code[0].coding[0].display = "Médecin"

* specialty[0].coding[0].system  = "https://mos.esante.gouv.fr/NOS/TRE_R38-SpecialiteOrdinale/FHIR/TRE-R38-SpecialiteOrdinale"
* specialty[0].coding[0].code    = #SM54
* specialty[0].coding[0].display = "Chirurgie générale"

* availableTime[0].daysOfWeek[0] = #mon
* availableTime[0].daysOfWeek[1] = #tue
* availableTime[0].daysOfWeek[2] = #wed
* availableTime[0].daysOfWeek[3] = #thu
* availableTime[0].daysOfWeek[4] = #fri
* availableTime[0].availableStartTime = "07:00:00"
* availableTime[0].availableEndTime   = "15:00:00"


// Miranda Bailey — Rôle 2
Instance: RoleBaileyChefDeService
InstanceOf: SoignantRole
Usage: #example
Title: "Dr. Miranda Bailey — Rôle Chef de service"
Description: "Miranda Bailey en tant que chef du service de chirurgie générale au Grey Sloan, mercredi et jeudi après-midi."

* active = true
* period.start = "2010-03-01"

* practitioner = Reference(MirandaBailey)
* organization.display = "Grey Sloan Memorial Hospital — Paris"

* code[0].coding[0].system  = "https://mos.esante.gouv.fr/NOS/TRE_G15-ProfessionSante/FHIR/TRE-G15-ProfessionSante"
* code[0].coding[0].code    = #10
* code[0].coding[0].display = "Médecin"

* specialty[0].coding[0].system  = "https://mos.esante.gouv.fr/NOS/TRE_R38-SpecialiteOrdinale/FHIR/TRE-R38-SpecialiteOrdinale"
* specialty[0].coding[0].code    = #SM54
* specialty[0].coding[0].display = "Chirurgie générale"

* availableTime[0].daysOfWeek[0] = #wed
* availableTime[0].daysOfWeek[1] = #thu
* availableTime[0].availableStartTime = "15:00:00"
* availableTime[0].availableEndTime   = "18:00:00"
