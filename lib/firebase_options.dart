import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    throw UnsupportedError(
      'DefaultFirebaseOptions have not been configured for platforms other than Web.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "AIzaSyCXiqL5BPAXnD5CZygMDvVuHkpvTfwIYa4",
    authDomain: "controle-horario-web.firebaseapp.com",
    projectId: "controle-horario-web",
    storageBucket: "controle-horario-web.firebasestorage.app",
    messagingSenderId: "937788846123",
    appId: "1:937788846123:web:218ed1fea11522a36e7a6e"
  );
}