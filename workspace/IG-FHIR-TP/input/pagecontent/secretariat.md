### Secrétariat — Création de rendez-vous

#### Rôle métier

Le **secrétariat** est responsable de la création des rendez-vous médicaux dans l'hôpital. À chaque rendez-vous, il associe :

- un **patient** (identifié par le Bureau des entrées) ;
- un **soignant** (recruté et géré par les RH) ;
- une **salle de soin** (gérée par le service Patrimoine) ;
- une **plage horaire** (date et heure de début / fin).

#### Ressources FHIR utilisées

| Ressource     | Profil utilisé              | Service responsable    |
|---------------|-----------------------------|------------------------|
| `Appointment` | `AppointmentSecretariat`    | **Secrétariat**        |
| `Patient`     | profil du Bureau des entrées| Bureau des entrées     |
| `Practitioner`| profil RH                   | Ressources Humaines    |
| `Location`    | profil Patrimoine           | Gestion du patrimoine  |

Le secrétariat ne (re)définit **que** la ressource `Appointment` ; il s'appuie sur les profils Patient, Practitioner et Location produits par les autres services pour rester aligné avec les standards nationaux (FrCore).

#### Profil `AppointmentSecretariat`

Le profil contraint la ressource FHIR R4 `Appointment` pour garantir un rendez-vous bien formé :

- **Champs obligatoires** : `status`, `start`, `end`, `appointmentType`, `description`, `created`.
- **Participants** : exactement (au moins) 3 participants, slicés par type de la référence pointée par `actor` :
  - `participant[patient]` → `Reference(Patient)` ;
  - `participant[practitioner]` → `Reference(Practitioner | PractitionerRole)`, **avec le RPPS du soignant dans `actor.identifier`** (système `urn:oid:1.2.250.1.71.4.2.1`) ;
  - `participant[location]` → `Reference(Location)`.
- **Invariant `app-end-after-start`** : la date/heure de fin doit être strictement postérieure à la date/heure de début.
- **Invariant `app-rpps-format`** : le numéro RPPS doit contenir exactement 11 chiffres.

#### Identification du soignant par RPPS (demande RH)

Pour permettre au service **Ressources Humaines** de retrouver tous les rendez-vous d'un soignant via son **RPPS** (*Répertoire Partagé des Professionnels de Santé*), la référence vers le `Practitioner` inclut systématiquement le RPPS dans `actor.identifier` :

```json
"actor": {
  "reference": "Practitioner/example-practitioner-martin",
  "identifier": {
    "system": "urn:oid:1.2.250.1.71.4.2.1",
    "value": "10003557123"
  },
  "display": "Dr Jean Martin"
}
```

> Avantage : les RH peuvent filtrer les RDV par RPPS **sans avoir à résoudre la ressource `Practitioner`**, ce qui simplifie les requêtes inter-services.

#### Cas d'usage

1. Le secrétariat reçoit une demande de RDV pour un patient.
2. Il vérifie la disponibilité d'un soignant et d'une salle.
3. Il crée une instance `Appointment` conforme au profil `AppointmentSecretariat`, avec le statut initial `pending` ou `booked`.
4. Une fois confirmé par le patient, le statut passe à `booked` ; en cas d'annulation, il passe à `cancelled`.

#### Liens avec les autres services

- **Bureau des entrées** peut rechercher tous les rendez-vous d'un patient via :
  `GET [base]/Appointment?patient=Patient/{id}`
- **Ressources Humaines** peut rechercher tous les rendez-vous d'un soignant directement via le RPPS porté par `actor.identifier` :
  `GET [base]/Appointment?actor.identifier=urn:oid:1.2.250.1.71.4.2.1|10003557123`
- **Gestion du patrimoine** peut rechercher tous les rendez-vous dans une salle via :
  `GET [base]/Appointment?location=Location/{id}`

#### Exemples fournis

- `ExampleAppointmentCardio` — RDV de consultation cardiologique confirmé.
- `ExampleAppointmentKine` — Séance de kinésithérapie en attente de confirmation.
