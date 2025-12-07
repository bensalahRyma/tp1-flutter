# TP1 Flutter – Profile Card & Quizz
Master 2 Informatique – GL  
Auteur : **Ryma Ben Salah**  
Année universitaire : **2025–2026**

---

## Présentation du projet

Ce projet a été réalisé dans le cadre du TP Flutter dont l’objectif principal était de se familiariser avec :

- les widgets `StatelessWidget` et `StatefulWidget`,
- la création d’interfaces graphiques modernes,
- la gestion d’assets (images),
- la navigation entre pages,
- la gestion de l'état via `setState()`.

L'application se compose de **deux écrans principaux** :

1. **Profile Page** : une carte de profil stylisée affichée grâce à un `StatelessWidget` (Stack + Card).
2. **Quizz Page** : un mini-quizz Vrai/Faux basé sur un `StatefulWidget`, avec correction des réponses et score final.

---

##  Structure du projet

lib/
├── main.dart
├── profile_page.dart
└── quizz_page.dart

assets/
└── avatar.png

---

## Fonctionnalités

###  Profile Page
- Avatar circulaire (image chargée depuis les assets).
- Carte moderne construite avec `Stack`, `Card`, `Positioned`.
- Affichage de données personnelles.
- UI responsive et agréable.

###  Quizz Page
- Liste de questions Vrai/Faux.
- Vérification de la réponse utilisateur.
- Mise à jour de l’état avec `setState()`.
- Affichage du score final.
- Bouton pour recommencer le quizz.

---

## Installation & Exécution
### 1️⃣ Prérequis
- Flutter SDK
- Android Studio ou VS Code
- Un simulateur ou un appareil physique

Pour vérifier votre installation :

```bash
flutter doctor
```

### 2️⃣ Télécharger le projet
```bash
git clone https://github.com/bensalahRyma/tp1-flutter
cd tp1_flutter
```

### 3️⃣ Installer les dépendances
```bash
flutter pub get
```

### 4️⃣ Lancer l'application
```bash
flutter run
```
---
## Architecture technique
###  Profile Page
- Basée sur un StatelessWidget.
- Composants principaux : `Stack`, `Card`, `CircleAvatar` ,`Row` ,`Column`,`Padding`.
- L’image est déclarée dans `pubspec.yaml`.

###  Quizz Page
- Basée sur un `StatefulWidget`.
- Gestion de l'état :
  - `index` pour suivre la question.
  - `score` pour compter les bonnes réponses.
  - `setState()` pour mettre à jour l’interface.
###  Modèle de données
```bash
class Question {
  final String text;
  final bool isCorrect;
  Question(this.text, this.isCorrect);
}
```
## Problèmes rencontrés et les solutions
###  Les images (assets) ne s’affichaient pas
- pour la correction , j'ai vérifié l'indentation dans `pubspec.yaml`
### Flutter Web ne recharge pas les assets
```bash
flutter clean
flutter pub get
flutter run -d chrome
```