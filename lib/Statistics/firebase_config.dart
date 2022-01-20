import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (Platform.isIOS) {
      // iOS
      return const FirebaseOptions(
        appId: '1:723581440577:ios:8812e20c1f120f4de72cc0',
        apiKey: 'AIzaSyAHTwcJexT0Ikth0d2wbrXmL5RrCSsxUT0',
        projectId: 'myfirebase-a5d22',
        messagingSenderId: '723581440577',
        iosBundleId: 'com.http.fcm',
      );
    } else {
      // Android
      return const FirebaseOptions(
        //apiKey: 'AIzaSyAHTwcJexT0Ikth0d2wbrXmL5RrCSsxUT0',
        apiKey: 'AAAAhJbmsAk:APA91bGoH2bNqEvkZRI5ppTS4f8ayVYQfZynEI_-3mumppcBM_r8kc6cRONdUOSNYfITBv-ZtPzu4j70VSe8-L5_WjHJC6qpgFzhHRVKw9d5tETXXr-KYJPEUZJ4FxZ9JoQ0kh61EWIq',

        //appId: '1:723581440577:android:506576c316f95d24e72cc0',
        appId: '1:569467383817:android:92c5e705edd0dc5f89c8d8',

        //messagingSenderId: '723581440577',
        messagingSenderId: '569467383817',

        //projectId: 'myfirebase-a5d22',
        projectId: 'flutterfirebase-cf581'
      );
    }
  }
}