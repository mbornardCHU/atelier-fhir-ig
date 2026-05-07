Profile: SoignantRole
Parent: PractitionerRole
Description: "A profile of FHIR R4 PractitionerRole for the French healthcare context."
* active           1..1 MS
* period           MS
* practitioner     1..1 MS
* organization     MS
* code             MS
* specialty        MS
* availableTime    MS

// référence vers notre profil Soignant
* practitioner only Reference(Soignant)

// Binding profession
* code from https://mos.esante.gouv.fr/NOS/TRE_G15-ProfessionSante/FHIR/TRE-G15-ProfessionSante (preferred)

// Binding spécialité
* specialty from https://mos.esante.gouv.fr/NOS/TRE_R38-SpecialiteOrdinale/FHIR/TRE-R38-SpecialiteOrdinale (preferred)