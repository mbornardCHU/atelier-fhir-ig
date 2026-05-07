// =====================================================================
// Exemple 2 : Rendez-vous de séance de kinésithérapie
// =====================================================================
// Scénario : le secrétariat planifie une séance de kinésithérapie
// pour Mme Marie Lefevre avec Mme Sophie Dubois en salle 202.
// Le RDV est encore en attente de confirmation par le patient.
// =====================================================================

Instance: ExampleAppointmentKine
InstanceOf: AppointmentSecretariat
Title: "RDV kinésithérapie - Mme Lefevre"
Description: "Séance de rééducation kinésithérapique planifiée pour la patiente Marie Lefevre avec la kinésithérapeute Sophie Dubois en salle 202 le 22 juin 2026. RDV en attente de confirmation."
Usage: #example

// Statut : RDV en attente de confirmation
* status = #pending

// Type de RDV : suivi
* appointmentType = http://terminology.hl7.org/CodeSystem/v2-0276#FOLLOWUP "A follow up visit from a previous appointment"

// Motif lisible
* description = "Séance de rééducation suite à entorse de la cheville droite"

// Date de création de l'enregistrement
* created = "2026-05-07T14:30:00+02:00"

// Créneau du RDV
* start = "2026-06-22T14:00:00+02:00"
* end   = "2026-06-22T14:45:00+02:00"

// --- Participant : patient ---
* participant[patient].actor = Reference(Patient/example-patient-lefevre)
* participant[patient].actor.display = "Marie Lefevre"
* participant[patient].status = #needs-action
* participant[patient].required = #required

// --- Participant : soignant ---
// La référence inclut le RPPS pour permettre aux RH de filtrer
// les RDV par numéro RPPS sans résoudre la ressource Practitioner.
* participant[practitioner].actor = Reference(Practitioner/example-practitioner-dubois)
* participant[practitioner].actor.identifier.system = "urn:oid:1.2.250.1.71.4.2.1"
* participant[practitioner].actor.identifier.value = "81234567890"
* participant[practitioner].actor.display = "Mme Sophie Dubois (Kinésithérapeute)"
* participant[practitioner].status = #accepted
* participant[practitioner].required = #required

// --- Participant : salle ---
* participant[location].actor = Reference(Location/example-location-salle202)
* participant[location].actor.display = "Salle 202 - Kinésithérapie"
* participant[location].status = #accepted
* participant[location].required = #required
