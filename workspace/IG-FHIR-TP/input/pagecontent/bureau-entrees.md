# TP Bureau des Entrées - Implementation Guide FHIR

## Contexte

Ce TP modélise le parcours d'admission d'un patient dans un bureau des entrées hospitalier à l'aide du standard FHIR et du langage FSH (FHIR Shorthand). Le profil Patient est basé sur le **FRCore français** (`fr-core-patient`).

## Architecture des ressources

```
CodeSystem (CSAllNationalities)
    └──▶ ValueSet (PatientValueSet)
              └──▶ Extension (PatientExtension)
                        └──▶ Profile (PatientProfile)
                                  └──▶ Exemples (PatientExample, PatientExample2)
```

## Description des ressources

### 1. CodeSystem — `CSAllNationalities`

**Fichier :** `code-system/CSAllNationalities.fsh`

Définit un système de codes représentant les nationalités. Chaque code utilise le code pays ISO 3166-1 alpha-2 comme identifiant et un libellé en français.

| Code | Libellé     |
|------|-------------|
| FR   | Française   |
| US   | Américaine  |
| DE   | Allemande   |
| IT   | Italienne   |
| ES   | Espagnole   |
| BE   | Belge       |

### 2. ValueSet — `PatientValueSet`

**Fichier :** `value-set/PatientValueSet.fsh`

Regroupe l'ensemble des codes du CodeSystem `CSAllNationalities` dans un jeu de valeurs utilisable pour le binding. C'est ce ValueSet qui est référencé par l'extension et le profil.

```fsh
* include codes from system CSAllNationalities
```

### 3. Extension — `PatientExtension`

**Fichier :** `extensions/PatientExtension.fsh`

Extension personnalisée ajoutant la **nationalité** à la ressource Patient. Elle contraint la valeur à un `CodeableConcept` avec un binding **required** vers le `PatientValueSet`.

- **Contexte :** Patient
- **Type de valeur :** `CodeableConcept`
- **Binding :** `PatientValueSet` (required)

### 4. Profil — `PatientProfile`

**Fichier :** `profiles/PatientProfile.fsh`

Profil Patient pour le bureau des entrées, héritant de `fr-core-patient`. Il impose les contraintes métier suivantes :

| Élément | Cardinalité | Description |
|---------|-------------|-------------|
| `name` | 1..* (MS) | Nom obligatoire |
| `birthDate` | 1..1 (MS) | Date de naissance obligatoire |
| `gender` | 1..1 (MS) | Sexe obligatoire |
| `identifier[ipp]` | 1..1 (MS) | Identifiant Patient Permanent (IPP) obligatoire |
| `identifier[ins]` | 0..1 (MS) | Identifiant National de Santé (INS) optionnel |
| `telecom` | MS | Coordonnées téléphoniques |
| `address` | MS | Adresse postale |
| `contact` | MS | Personne de confiance |
| `photo` | 0..0 | Photo **interdite** |
| `extension[nationalite]` | 0..1 (MS) | Nationalité via l'extension custom |
| `generalPractitioner` | MS | Médecin traitant (référence vers `fr-core-practitioner`) |

**Slicing des identifiants :**

- **IPP** : système `https://chu-ISIS.fr/fhir/sid/ipp`, type `MR` (Medical Record Number)
- **INS** : système `urn:oid:1.2.250.1.213.1.4.8`, type `NI` (National Unique Individual Identifier)

### 5. Exemples

#### PatientExample — Sara Sarkissian

**Fichier :** `examples/PatientExample.fsh`

| Champ | Valeur |
|-------|--------|
| IPP | 123456 |
| Nom | Sarkissian Sara |
| Date de naissance | 15/04/1991 |
| Sexe | Féminin |
| Adresse | 12 Rue des Lilas, 31000 Toulouse |
| Nationalité | Française (FR) |
| Médecin traitant | Dr. Martin Jean |

#### PatientExample2 — Tiphaine Meriot

**Fichier :** `examples/PatientExample2.fsh`

| Champ | Valeur |
|-------|--------|
| IPP | 789012 |
| INS | 2850675431234 |
| Nom | Meriot Tiphaine |
| Date de naissance | 22/07/1985 |
| Sexe | Féminin |
| Téléphone | +33 6 12 34 56 78 (mobile) |
| Nationalité | Belge (BE) |
| Médecin traitant | Dr. Dupont Marie |

## Chaîne de conformité

La nationalité suit une chaîne complète de conformité FHIR :

1. Le **CodeSystem** définit les codes autorisés
2. Le **ValueSet** expose ces codes sous forme de jeu de valeurs
3. L'**Extension** utilise ce ValueSet via un binding `required`
4. Le **Profil** déclare l'extension et contraint son usage
5. Les **Exemples** instancient le profil avec des valeurs concrètes issues du CodeSystem
