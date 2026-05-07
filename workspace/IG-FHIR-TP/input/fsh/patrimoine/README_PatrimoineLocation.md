# Documentation Technique : Profil PatrimoineLocation

Ce document détaille les choix de conception, les cardinalités et les règles métier appliquées au profil FHIR `PatrimoineLocation`.

## 1. Analyse des Cardinalités et Obligations

| Élément | Cardinalité | Obligatoire (MS) | Justification |
| :--- | :---: | :---: | :--- |
| `status` | 1..1 | ✅ | Indispensable pour la sécurité. Une salle ne peut être utilisée sans connaître son état (active, en maintenance, etc.). |
| `name` | 1..1 | ✅ | Requis pour l'identification humaine et l'affichage dans les interfaces logicielles. |
| `type` | 1..1 | ✅ | Permet de classifier la salle (Bloc, Chambre, etc.) et de déclencher des règles métier spécifiques. |
| `identifier` | 1..* | ✅ | Au moins un identifiant métier est requis pour assurer la traçabilité. |
| `extension[environmentControl]` | 0..* | ✅ | Optionnel au niveau global, mais devient critique pour les blocs opératoires ou laboratoires. |
| `partOf` | 0..1 | ✅ | Permet de construire la hiérarchie (Salle -> Étage -> Bâtiment). |

## 2. Terminologies et Nomenclatures

### 2.1 Statuts des salles (ValueSet : VSLocationStatuses)
Les statuts permettent de piloter la disponibilité opérationnelle :
*   `active` : Prête à l'usage.
*   `maintenance` : Hors service pour intervention technique.
*   `quarantined` : Risque infectieux ou contamination, accès restreint.
*   `unclean` : En attente de bionettoyage.

### 2.2 Contrôles Environnementaux (CodeSystem : CSLocationEnvironmentControls)
Utilisés via l'extension dédiée pour qualifier les capacités techniques d'un lieu :
*   `#air` : Qualité de l'air contrôlée (flux laminaire).
*   `#temperature` : Monitoring thermique (ex: stockage de vaccins).
*   `#pressure` : Pression positive/négative (indispensable en bloc ISO 5).
*   `#sterility` : Niveau de stérilité garanti.

## 3. Règles Métier et Contraintes (Invariants)

1.  **Cohérence de type** : Si une `Location` est de type `BAT` (Bâtiment), elle ne doit pas posséder d'extension de contrôle de stérilité.
2.  **Hiérarchie** : Une `Location` de type `CHB` (Chambre) doit obligatoirement avoir un élément `partOf` pointant vers une `Location` de type `ETG` (Étage) ou `SRV` (Service).
3.  **Bloc Opératoire** : Tout lieu défini avec le code `#BLC` (Bloc) doit obligatoirement renseigner au moins deux contrôles environnementaux : `#sterility` et `#pressure`.

## 4. Exemples de conformité

### Instance Valide (Salle d'examen)
```fsh
Instance: salle-01
InstanceOf: PatrimoineLocation
* status = #active
* name = "Salle d'examen 1"
* type = #SLE
```

### Instance Valide (Bloc chirurgical)
```fsh
Instance: bloc-03
InstanceOf: PatrimoineLocation
* status = #active
* name = "Bloc Orthopédie 3"
* type = #BLC
* extension[environmentControl][0].valueCodeableConcept = CS#sterility
* extension[environmentControl][1].valueCodeableConcept = CS#pressure

