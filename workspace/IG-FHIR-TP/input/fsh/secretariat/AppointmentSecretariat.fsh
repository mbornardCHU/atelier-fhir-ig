// =====================================================================
// Profil : AppointmentSecretariat
// Auteur : Service Secrétariat
// Description : Profil FHIR pour les rendez-vous créés par le
// secrétariat de l'hôpital, qui lient un patient, un soignant
// et une salle de soin (Location).
// Standard de référence : FHIR R4 (cohérent avec FrCore)
// =====================================================================

// ---------------------------------------------------------------------
// Alias des systèmes d'identifiants nationaux (lisibilité)
// ---------------------------------------------------------------------
// RPPS : Répertoire Partagé des Professionnels de Santé
// OID national français des soignants - 11 chiffres
Alias: $RPPS = urn:oid:1.2.250.1.71.4.2.1

Profile: AppointmentSecretariat
Parent: Appointment
Id: appointment-secretariat
Title: "Rendez-vous - Secrétariat"
Description: "Rendez-vous créé par le secrétariat reliant un Patient, un Practitioner (soignant) et une Location (salle de soin) de l'hôpital."

// ---------------------------------------------------------------------
// Champs principaux du rendez-vous
// ---------------------------------------------------------------------

// Statut du RDV (proposed | pending | booked | arrived | cancelled ...)
// Déjà 1..1 dans la ressource de base, on ajoute juste le flag MS
// pour préciser qu'il doit être supporté par les implémentations.
* status MS

// Date / heure de début et de fin : obligatoires pour un RDV planifié
* start 1..1 MS
* end   1..1 MS

// Type fonctionnel du RDV (consultation, suivi, urgence...) recommandé
* appointmentType MS

// Description / motif lisible du RDV
* description MS

// Date de création de l'enregistrement (utile pour la traçabilité)
* created MS

// ---------------------------------------------------------------------
// Slicing des participants
// ---------------------------------------------------------------------
// Un RDV doit avoir au minimum 3 participants : le patient, le soignant
// et la salle (Location). On utilise un slicing de type "type" sur le
// champ "actor" pour distinguer les participants selon le type de la
// ressource référencée.
// ---------------------------------------------------------------------

* participant 3..* MS
* participant ^slicing.discriminator.type = #profile
* participant ^slicing.discriminator.path = "actor.resolve()"
* participant ^slicing.rules = #open
* participant ^slicing.description = "Slicing des participants par type de la ressource référencée par actor (Patient, Practitioner, Location)."

* participant contains
    patient      1..1 MS and
    practitioner 1..1 MS and
    location     1..1 MS

// --- Slice "patient" : le patient pour qui est pris le RDV ---
* participant[patient].actor 1..1 MS
* participant[patient].actor only Reference(Patient)
* participant[patient].status MS

// --- Slice "practitioner" : le soignant qui réalisera le RDV ---
// On accepte aussi PractitionerRole pour gérer le rattachement à un
// service / une organisation, comme prévu par les RH.
//
// Demande RH : pouvoir chercher les RDV d'un soignant via son RPPS.
// On exige donc le RPPS directement dans Reference.identifier, ce qui
// évite aux RH de résoudre la ressource Practitioner pour filtrer.
* participant[practitioner].actor 1..1 MS
* participant[practitioner].actor only Reference(Practitioner or PractitionerRole)
* participant[practitioner].actor.identifier 1..1 MS
* participant[practitioner].actor.identifier.system 1..1 MS
* participant[practitioner].actor.identifier.system = $RPPS
* participant[practitioner].actor.identifier.value 1..1 MS
* participant[practitioner].status MS

// --- Slice "location" : la salle de soin où aura lieu le RDV ---
* participant[location].actor 1..1 MS
* participant[location].actor only Reference(Location)
* participant[location].status MS

// ---------------------------------------------------------------------
// Application des invariants
// ---------------------------------------------------------------------
// Les invariants sont déclarés plus bas (blocs Invariant:). Ici on les
// rattache aux éléments concernés du profil.
// ATTENTION FSH : les règles "* obeys" doivent être DANS le bloc
// Profile, donc AVANT toute déclaration Invariant: dans le fichier.
// ---------------------------------------------------------------------

// Invariant au niveau de la ressource (cohérence start/end)
* obeys app-end-after-start

// Invariant porté par l'identifier du soignant (format RPPS)
* participant[practitioner].actor.identifier obeys app-rpps-format

// =====================================================================
// Déclarations des invariants
// =====================================================================

// Invariant 1 : la date/heure de fin doit être strictement postérieure
// à la date/heure de début, sinon le RDV n'a pas de durée valide.
Invariant: app-end-after-start
Description: "La date/heure de fin doit être strictement postérieure à la date/heure de début"
Severity: #error
Expression: "end > start"

// Invariant 2 : le numéro RPPS du soignant doit contenir exactement
// 11 chiffres (norme nationale française).
Invariant: app-rpps-format
Description: "Le numéro RPPS du soignant doit contenir exactement 11 chiffres"
Severity: #error
Expression: "value.matches('^[0-9]{11}$')"
