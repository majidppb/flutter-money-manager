# Money Manager

- A basic money manager CRUD (Create, Read, Update, Delete) flutter app.
- It provides a basic analysis of transactions using charts.
- Built with [Firebase] Auth (Google Sign in) and Firestore.
- Utilized [Bloc] for effective state management.
- Follows the Clean architecture.

## Running the project

- Clone the repository
-  Get the packages
```bash
cd money_manager
flutter pub get
```

- Create a new [Firebase] project.
- Enable the Google sign-in method in the authentication section.
- Provide the SHA-1 fingerprint / key.
- [Install and initialize the Firebase SDKs for Flutter]

-  Run the app

```bash
flutter run
```



 Note : *The application was run on Android while in development and was not tested on iOS.*
 ## Screenshots
 <p align="center">
  <img src="screenshots/signin.jpg" alt="Sign in" width="200"/>
  <br>
  <img src="screenshots/statistics.jpg" alt="Sign in" width="200"/>
  <br>
  <img src="screenshots/date_range.jpg" alt="Sign in" width="200"/>
  <img src="screenshots/transactions_loading.jpg" alt="Transactions  Loading" width="200"/>
  <img src="screenshots/error_screen.jpg" alt="Error" width="200"/>
  <img src="screenshots/transactions.jpg" alt="Transactions" width="200"/>  
  <img src="screenshots/transactions_delete.jpg" alt="Swipe the transaction item for delete button" width="200"/>
  <img src="screenshots/new_transaction.jpg" alt="New Transaction" width="200"/>
  <img src="screenshots/categories.jpg" alt="Categories" width="200"/>
  <img src="screenshots/new_category.jpg" alt="New Category" width="200"/>
  <img src="screenshots/settings.jpg" alt="Settings" width="200"/>
</p>

[Install and initialize the Firebase SDKs for Flutter]: <https://firebase.google.com/docs/flutter/setup?platform=android>
[Firebase]: <https://console.firebase.google.com/>
[Bloc]:<https://pub.dev/packages/flutter_bloc>