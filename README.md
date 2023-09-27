# nouvel_air

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Development 

Lancer l'émulateur

    firebase emulators:start

Mettre à jour firebase

    flutterfire configure


Après cette exécution initiale de flutterfire configure , vous devez réexécuter la commande chaque fois que vous :
Commencez à prendre en charge une nouvelle plate-forme dans votre application Flutter.
Commencez à utiliser un nouveau service ou produit Firebase dans votre application Flutter, surtout si vous commencez à vous connecter avec Google, Crashlytics, Performance Monitoring ou Realtime Database.
La réexécution de la commande garantit que la configuration Firebase de votre application Flutter est à jour et (pour Android) ajoute automatiquement tous les plugins Gradle requis à votre application.

Lorsque cette commande est exécutée, vous serez invité à sélectionner le projet Firebase que vous souhaitez utiliser et les plates-formes que vous souhaitez configurer. 


Regénérer le splash

    dart run flutter_native_splash:create
