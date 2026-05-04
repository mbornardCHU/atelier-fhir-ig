
# Atelier FHIR – Création d’un Implementation Guide (IG) avec Docker

## Objectif
Dans ce TP, vous allez créer et manipuler un Implementation Guide FHIR sans rien installer sur votre machine (à part Docker).
Tout se fait dans un conteneur, mais les fichiers restent accessibles sur votre ordinateur.

---

Prérequis

* Docker Desktop installé
* Docker Desktop lancé

---

### Étape 1 – Récupérer le projet

Cloner le repository fourni :
```bash
git clone <repo>
cd <nom-du-repo>
```
---

### Étape 2 – Construire l’environnement Docker

Cette étape installe tous les outils nécessaires (SUSHI, IG Publisher, Java, etc.) dans une image Docker.
```bash
docker compose build
```
Cette commande peut prendre quelques minutes la première fois.

---

### Étape 3 – Lancer le conteneur

On ouvre un terminal à l’intérieur du conteneur :
```bash
docker compose run --rm fhir-ig bash
```
Vous êtes maintenant dans un environnement prêt à l’emploi.

---

### Étape 4 – Comprendre le fonctionnement

Le dossier /workspace dans le conteneur est relié au dossier workspace sur votre machine.

Cela signifie que :

* tout ce que vous créez dans le conteneur apparaît sur votre PC
* vous pouvez modifier les fichiers avec votre éditeur (VS Code par exemple)

---

### Étape 5 – Initialiser un projet FHIR IG

Dans le conteneur :
```bash
cd /workspace
sushi init
```
Vous allez devoir répondre à quelques questions (nom du projet, id, etc.).

Un nouveau dossier est créé dans workspace sur votre machine.

---

### Étape 6 – Se déplacer dans le projet

Exemple :
```bash
cd mon-ig
```
(adaptez avec le nom que vous avez choisi)

---

### Étape 7 – Compiler les fichiers FSH

Dans le dossier du projet :
```bash
sushi .
```
Important : ne pas oublier le point à la fin.

Cette commande permet de transformer vos fichiers FSH en ressources FHIR (JSON).

---

### Étape 8 – Générer l’Implementation Guide (site web)

Toujours dans le dossier du projet :
```bash
./_genonce.sh
```
Cette commande génère le site web de votre IG.

---

### Étape 9 – Résultat

Une fois terminé, vous trouverez le résultat ici :
```bash
workspace/mon-ig/output/
```
Vous pouvez ouvrir le fichier index.html dans votre navigateur pour voir votre IG.

---

Résumé des commandes principales
```bash
docker compose build
docker compose run --rm fhir-ig bash
cd /workspace
sushi init
cd mon-ig
sushi .
./_genonce.sh
```
---

### Points d’attention

* Toujours travailler dans /workspace
* Ne pas oublier le "." dans sushi .
* Si une commande ne marche pas, vérifier dans quel dossier vous êtes
* Les fichiers générés apparaissent automatiquement sur votre machine

