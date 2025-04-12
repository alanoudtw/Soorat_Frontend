import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAoLQNTdo6XpBiWetfhdE4jv2CCI0OjaTk",
            authDomain: "soorat-backend.firebaseapp.com",
            projectId: "soorat-backend",
            storageBucket: "soorat-backend.firebasestorage.app",
            messagingSenderId: "369883169476",
            appId: "1:369883169476:web:432fce4df69f5a41833f91"));
  } else {
    await Firebase.initializeApp();
  }
}
