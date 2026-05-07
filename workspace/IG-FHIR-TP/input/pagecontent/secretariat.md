## 📅 Secrétariat — Gestion des rendez-vous

> **Auteurs** · Achraf Acheche · Sinda Ben Yahmed · Rahma Ben Younes

---

### 🎯 Mission

Le **secrétariat** crée les rendez-vous entre un **patient**, un **soignant** et une **salle** de l'hôpital. Notre périmètre se limite à la ressource FHIR `Appointment`.

---

### 🧩 Profil livré

| Profil | Hérite de | Description |
|--------|-----------|-------------|
| **`AppointmentSecretariat`** | `Appointment` (R4) | Rendez-vous reliant patient, soignant et salle |

#### Ressources référencées (gérées par les autres groupes)

| Ressource     | Groupe responsable   |
|:-------------:|----------------------|
| 👤 `Patient`     | Bureau des entrées     |
| 🧑‍⚕️ `Practitioner`| Ressources Humaines    |
| 🏥 `Location`    | Gestion du patrimoine  |

> 💡 On référence les **types de base FHIR**, pas un profil précis. Cela permet d'accepter le travail des **deux équipes RH** indifféremment (qu'elles aient nommé leur profil `Soignant`, `Practitioner` ou autre).

---

### 📐 Règles du profil

- ✅ Date de **début** et date de **fin** obligatoires
- ✅ **Statut**, **type** et **motif** obligatoires
- ✅ Exactement **3 participants** : un patient, un soignant, une salle
- ✅ Le soignant est identifié par son **RPPS** (OID `urn:oid:1.2.250.1.71.4.2.1`)
- 🛡️ Invariant **`fin-apres-debut`** : `end > start`

---

### 🔑 Identification du soignant par RPPS

Pour que les RH puissent retrouver les RDV d'un soignant par son numéro RPPS, le RPPS est inscrit **directement dans la référence** :

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

---

### 🔍 Requêtes inter-services

| Service | Besoin | Requête FHIR |
|---------|--------|--------------|
| 👤 Bureau des entrées | RDV d'un patient | `GET [base]/Appointment?patient=Patient/dupont` |
| 🧑‍⚕️ RH | RDV d'un soignant (par RPPS) | `GET [base]/Appointment?actor.identifier=urn:oid:1.2.250.1.71.4.2.1\|10003557123` |
| 🏥 Patrimoine | RDV dans une salle | `GET [base]/Appointment?location=Location/salle-101` |

---

### 🧪 Exemples fournis

| Exemple | Scénario | Statut |
|---------|----------|:------:|
| **`ExampleAppointmentCardio`** | Consultation cardiologique de M. Dupont avec le Dr Martin | `booked` |
| **`ExampleAppointmentKine`** | Séance de kiné de Mme Lefevre avec Mme Dubois | `pending` |

---

### 🤝 Cohérence avec les autres groupes

- **RH (les deux équipes)** — on référence le type de base `Practitioner` : compatible avec n'importe quel profil RH (`Soignant`, `Practitioner`, etc.). RPPS et cardinalité `1..1` alignés.
- **Bureau des entrées** — on référence le type `Patient`.
- **Patrimoine** — on référence le type `Location`.
