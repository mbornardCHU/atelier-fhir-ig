# Documentation du groupe RH

## Objectif

Le groupe RH modélise les soignants recrutés par les ressources humaines de l'hôpital.

La ressource FHIR utilisée est `Practitioner`, car elle permet de représenter un professionnel de santé avec ses informations d'identification, ses coordonnées, son nom, son genre, sa langue de communication et ses qualifications.

## Ressources créées

Nous avons créé un profil FHIR nommé `RHPractitioner`.

Ce profil permet de représenter un soignant avec les informations nécessaires au service des ressources humaines.

Les informations obligatoires sont notamment :

- un identifiant interne de l'hôpital ;
- un numéro RPPS ;
- le nom et le prénom du soignant ;
- au moins un moyen de contact ;
- le genre ;
- une photo ;
- une langue de communication ;
- une qualification professionnelle.

## Gestion des grades

Pour gérer les grades des soignants, nous avons créé un `CodeSystem` nommé `CSGrade`.

Il contient les grades possibles :

- chirurgien ;
- médecin généraliste ;
- interne ;
- chef de clinique.

Nous avons aussi créé un `ValueSet` nommé `GradeValueSet`, qui reprend les codes du `CodeSystem`.

Ce `ValueSet` est utilisé dans le profil `RHPractitioner` pour limiter les qualifications possibles aux grades définis par le groupe RH.

## Exemples

Deux exemples de soignants ont été créés :

- un médecin généraliste ;
- un chirurgien.

Ces exemples montrent comment renseigner les informations principales d'un soignant dans le profil `RHPractitioner`.

## Usage dans le TP

Dans le scénario du TP, le service RH recrute les soignants et doit pouvoir les identifier grâce à leur numéro RPPS.

Le profil `RHPractitioner` permet donc de fournir une représentation structurée des soignants, qui pourra ensuite être utilisée par les autres services de l'hôpital, par exemple pour afficher les rendez-vous d'un soignant ou pour connaître son affectation.