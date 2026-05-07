**Anissa DAOUD** • **Erij AMEUR** • **Jean ESTADIEU** • **Eva TUBIA**

---

# Groupe Ressources Humaines 2

## Contexte et périmètre

Ce module couvre la gestion des soignants dans le système d'information de santé.
Il répond à deux besoins métier principaux :

- **Recruter des soignants** : enregistrer et identifier un professionnel de santé via son numéro RPPS.
- **Consulter le profil d'un soignant** : accéder à ses informations personnelles, ses qualifications et ses disponibilités à partir de son numéro RPPS.

> La gestion des structures (organisations, services, lieux) est prise en charge par le **bloc Patrimoine**, et la gestion des rendez-vous est prise en charge par le **bloc Secretariat**. Ce module se limite aux ressources `Practitioner` et `PractitionerRole`.

---

## Ressources utilisées

### Vue d'ensemble

```
Soignant (Practitioner)
    Identité, RPPS, qualifications, langues

SoignantRole (PractitionerRole)
    Spécialité, disponibilités, lien vers l'organisation
```

Un soignant (`Soignant`) peut avoir plusieurs rôles (`SoignantRole`) selon les structures où il exerce.

---

## Profil `Soignant`

**Ressource parente** : [`Practitioner`](https://hl7.org/fhir/R4/practitioner.html) (FHIR R4)

**Description** : Représente un professionnel de santé identifié par son numéro RPPS dans le système français.


| Élément | Cardinalité | Description |
|---|---|---|
| `active` | 1..1 | Indique si le soignant est actif |
| `identifier[RPPS]` | 1..1 | Identifiant national RPPS (obligatoire) |
| `identifier[RPPS].system` | 1..1 | Fixé à `urn:oid:1.2.250.1.71.4.2.1` |
| `identifier[RPPS].value` | 1..1 | Numéro RPPS à 11 chiffres |
| `name` | 1..* | Nom du soignant |
| `name.family` | 1..1 | Nom de famille |
| `name.given` | 1..* | Prénom(s) |
| `gender` | 1..1 | Genre administratif |
| `birthDate` | 1..1 | Date de naissance |
| `telecom` | 1..* | Coordonnées professionnelles |
| `address` | 0..* | Adresse professionnelle |
| `qualification` | 0..* | Diplômes et certifications |
| `communication` | 0..* | Langues pratiquées (BCP-47) |

### Extensions

| Extension | Cardinalité | Description |
|---|---|---|
| `PractitionerNationality` | 0..1 | Nationalité administrative (ISO 3166-1 alpha-2) |
| `PractitionerBirthPlace` | 0..1 | Lieu de naissance du soignant |

### Identifiant RPPS

Le RPPS (Répertoire Partagé des Professionnels intervenant dans le système de Santé) est l'identifiant national unique de tout professionnel de santé en France.

```
system : urn:oid:1.2.250.1.71.4.2.1
value  : <numéro à 11 chiffres>
```

### Exemples

- [`MeredithGrey`](./examples/soignants.fsh) — Chirurgienne générale
- [`AlexKarev`](./examples/soignants.fsh) — Chirurgien pédiatrique
- [`MirandaBailey`](./examples/soignants.fsh) — Chirurgienne générale

---

## Profil `SoignantRole`

**Ressource parente** : [`PractitionerRole`](https://hl7.org/fhir/R4/practitionerrole.html) (FHIR R4)

**Description** : Représente le rôle exercé par un soignant dans une structure de santé donnée. Un même soignant peut avoir plusieurs rôles dans des structures différentes.

### Éléments contraints

| Élément | Cardinalité | Description |
|---|---|---|
| `active` | 1..1 | Indique si le rôle est actif |
| `period` | 0..1 | Période d'exercice dans ce rôle |
| `practitioner` | 1..1 | Référence vers le profil `Soignant` |
| `organization` | 0..1 | Structure d'exercice (groupe Patrimoine) |
| `code` | 0..* | Profession (TRE-G15) |
| `specialty` | 0..* | Spécialité médicale (TRE-R38) |
| `availableTime` | 0..* | Plages de disponibilité |

### Terminologies utilisées

| Élément | ValueSet | Système |
|---|---|---|
| `code` (profession) | TRE-G15 — Profession Santé | `https://mos.esante.gouv.fr/NOS/TRE_G15-ProfessionSante/FHIR/TRE-G15-ProfessionSante` |
| `specialty` | TRE-R38 — Spécialité Ordinale | `https://mos.esante.gouv.fr/NOS/TRE_R38-SpecialiteOrdinale/FHIR/TRE-R38-SpecialiteOrdinale` |

### Référence inter-profils

`SoignantRole.practitioner` est contraint pour ne référencer **que** des instances conformes au profil `Soignant` :

```fsh
* practitioner only Reference(Soignant)
```

### Exemples

- [`MeredithGreyRole1`](./examples/roles.fsh) — Rôle de chirurgienne générale à l'hôpital Seattle Grace
- [`MeredithGreyRole2`](./examples/roles.fsh) — Rôle de chef du service de chirurgie à l'hôpital Seattle Grace
---

## Cas d'usage

### Recruter un soignant

1. Créer une instance `Soignant` avec le numéro RPPS du professionnel.
2. Renseigner les qualifications et les langues pratiquées.
3. Créer une instance `SoignantRole` associant ce soignant à la structure qui le recrute, avec la spécialité et les disponibilités.
---

## Structure des fichiers FSH

```
input/fsh/
├── profiles/
│   ├── soignant.fsh          # Profil Soignant (Practitioner)
│   └── role.fsh              # Profil SoignantRole (PractitionerRole)
├── extensions/
│   ├── nationality.fsh       # Extension PractitionerNationality
│   └── birthPlace.fsh        # Extension PractitionerBirthPlace
└── examples/
    ├── soignants.fsh          # Exemples Soignant
    └── roles.fsh              # Exemples SoignantRole
```

---

## Références

- [FHIR R4 — Practitioner](https://hl7.org/fhir/R4/practitioner.html)
- [FHIR R4 — PractitionerRole](https://hl7.org/fhir/R4/practitionerrole.html)
- [ANS — Annuaire Santé IG](https://interop.esante.gouv.fr/ig/fhir/annuaire)
- [NOS ANS — TRE-R38 Spécialités ordinales](https://mos.esante.gouv.fr/NOS/TRE_R38-SpecialiteOrdinale/FHIR/TRE-R38-SpecialiteOrdinale)
- [NOS ANS — TRE-G15 Professions de santé](https://mos.esante.gouv.fr/NOS/TRE_G15-ProfessionSante/FHIR/TRE-G15-ProfessionSante)
