import 'package:firebase_core/firebase_core.dart';

import '../../utils.dart';

class FirebaseService {
  static Future<void> initialize() async {
    await Firebase.initializeApp(
            // options: DefaultFirebaseOptions.currentPlatform,
            )
        .then((firebaseApp) {
      LogUtils.i({
        'from': 'Firebase initializeApp',
        'name': firebaseApp.name,
        'projectId': firebaseApp.options.projectId,
      });
    });
  }
}
