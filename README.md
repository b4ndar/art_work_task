# Art Work App **🎨**


## **Table of Contents**

1. [Prerequisites](#prerequisites)
2. [Getting Started](#getting-started)
3. [Firebase Setup](#firebase-setup)
4. [Providing Backup Database](#providing-backup-database)
5. [Running the App](#running-the-app)
---

## **Prerequisites**

Before you begin, ensure you have met the following requirements:

- **Flutter**: Make sure you have Flutter installed. If not, follow the installation guide at **[Flutter Installation](https://flutter.dev/docs/get-started/install)**.
- **Firebase Account**: You need a Firebase account to set up Firebase services. If you don't have one, you can create an account at **[Firebase Console](https://console.firebase.google.com/)**.

---

## **Getting Started**

1. Clone this repository to your local machine:

    ```bash
    bashCopy code
    git clone https://github.com/b4ndar/art_work_task
    
    ```

2. Run the following command to fetch dependencies:

    ```bash
    bashCopy code
    flutter pub get
    
    ```


---

## **Firebase Setup**

### **1. Create a Firebase Project**

1. Go to the **[Firebase Console](https://console.firebase.google.com/)**.
2. Click on "Add Project" and follow the prompts to create a new Firebase project.

### **2. Add the Firebase Config**

1. In the Firebase Console, select your project.
2. Navigate to Project settings (the gear icon) > General.
3. Under Your apps, click on the Firebase SDK snippet.
4. Choose the "Config" option and copy the Firebase config object.
5. Open the **`lib/firebase/firebase_config.dart`** file in your Flutter project and replace the placeholders with the Firebase config values:

    ```dart
    dartCopy code
    const Map<String, dynamic> firebaseConfig = { "apiKey": "YOUR_API_KEY", "authDomain": "YOUR_AUTH_DOMAIN", "projectId": "YOUR_PROJECT_ID", "storageBucket": "YOUR_STORAGE_BUCKET", "messagingSenderId": "YOUR_MESSAGING_SENDER_ID", "appId": "YOUR_APP_ID", };
    
    ```


### **3. Enable Firebase Authentication**

1. In the Firebase Console, go to Authentication > Sign-in method.
2. Enable the "Email/Password" sign-in method.

### 4.**Firestore Setup**

1. **Import Backup Firestore Database**

   Instead of creating a new Firestore database, you will use a pre-configured backup database provided in this repository.

    - Download the Firestore backup from the following link: **[Firestore Backup]([(https://drive.google.com/file/d/1ZNlTWtkw1lrBXMJyGCeMrNzQIm_jqEh_/view?usp=sharing)]**.
    - Import the backup into your Firebase project by following these steps:
        - Create a new Firestore database .
        - In the Firebase Console, go to Prject Setting . 
        - Service account and then Generate new private key . 
        - Use the following command in the directory folder where you have backup file and genereted key
       ```bash
        bashCopy code
        npx -p node-firestore-import-export firestore-import -a <genereted key file here> -b <backfile here>
    
        ```

---

## **Running the App**

1. Connect your device or set up an emulator.
2. Run the app using the following command:

    ```bash
    bashCopy code
    flutter run
    
    ```

3. You should see the app running on your device/emulator.
4. Sign up as a user using Firebase Authentication.
5. Use the app's features that interact with Firestore.

---

Congratulations! You've successfully set up and run a Flutter app that uses Firebase and Firestore for data storage and user authentication. If you encounter any issues or have questions, please refer to the project's GitHub repository or create a new issue for assistance.
