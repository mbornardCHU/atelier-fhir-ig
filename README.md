# Atelier FHIR IG avec Docker

## Prérequis
- Docker Desktop installé et démarré

## 1. Construire l’image
```bash
docker compose build
```
## 2. Ouvrir un shell dans le conteneur
```bash
docker compose run --rm fhir-ig bash
```
## 3. Initialiser un projet SUSHI
Dans le container :
```bash
cd /workspace
sushi init
```
Les fichiers générés apparaîtront aussi dans le dossier `workspace` de votre machine.

## 4. Aller dans le projet généré 
Exemple :
```bash
cd mon-ig
```
## 5. Compiler les fichiers FSH

```bash
sushi .
```
Attention : ne pas oublier le `.`.

```bash
git clone <repo>
cd atelier-fhir-ig
docker compose build
docker compose run --rm fhir-ig bash
cd /workspace
sushi init
``` 