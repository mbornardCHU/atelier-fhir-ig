### Secrétariat

**Groupe Secrétariat** — Achraf Acheche · Sinda Ben Yahmed · Rahma Ben Younes

Le secrétariat crée les rendez-vous entre un patient, un soignant et une salle de l'hôpital.

#### Ressource utilisée

Le secrétariat utilise un seul profil FHIR : **`AppointmentSecretariat`** (basé sur la ressource `Appointment`).

Ce profil référence des ressources gérées par les autres services :

| Ressource     | Service responsable    |
|---------------|------------------------|
| `Patient`     | Bureau des entrées     |
| `Practitioner`| Ressources Humaines    |
| `Location`    | Gestion du patrimoine  |

> On référence le **type de base FHIR** `Practitioner`, pas un profil spécifique. Cela permet d'accepter le travail des **deux équipes RH** : qu'elles aient nommé leur profil `Soignant` ou `Practitioner`, toute ressource dont le `resourceType` est `Practitioner` est acceptée.

#### Règles du profil

- Le rendez-vous a obligatoirement une date de début, une date de fin, un statut et un motif.
- Il a 3 participants : un patient, un soignant et une salle.
- Le soignant est identifié par son **RPPS** (numéro national, OID `1.2.250.1.71.4.2.1`).
- La date de fin doit être après la date de début (invariant `fin-apres-debut`).

#### RPPS du soignant

Pour permettre aux RH de retrouver les RDV d'un soignant via son RPPS, le numéro est inclus directement dans la référence :

```json
"actor": {
  "reference": "Practitioner/martin",
  "identifier": {
    "system": "urn:oid:1.2.250.1.71.4.2.1",
    "value": "10003557123"
  },
  "display": "Dr Jean Martin"
}
```

#### Recherches utiles pour les autres services

- Bureau des entrées — RDV d'un patient :
  `GET [base]/Appointment?patient=Patient/dupont`
- RH — RDV d'un soignant par RPPS :
  `GET [base]/Appointment?actor.identifier=urn:oid:1.2.250.1.71.4.2.1|10003557123`
- Patrimoine — RDV dans une salle :
  `GET [base]/Appointment?location=Location/salle-101`

#### Exemples

- `ExampleAppointmentCardio` — consultation de cardiologie confirmée.
- `ExampleAppointmentKine` — séance de kiné en attente de confirmation.

#### Cohérence avec les autres groupes

- **RH (les deux équipes)** : on référence le type de base `Practitioner`, ce qui accepte le travail des deux équipes peu importe leur nommage de profil (`Soignant`, `Practitioner`, etc.). Le système RPPS et la cardinalité 1..1 sont alignés.
- **Bureau des entrées** : on référence le type `Patient` dans `participant[patient].actor`.
- **Patrimoine** : on référence le type `Location` dans `participant[location].actor`.
