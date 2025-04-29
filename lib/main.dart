import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:students_complaint_app/app.dart';
import 'package:students_complaint_app/data/repositories/authentiction_repo.dart';
import 'package:students_complaint_app/firebase_options.dart';

void main() async {
  // -- widget binding
  final widgetBinding = WidgetsFlutterBinding.ensureInitialized();

  // -- initialize get storage
  await GetStorage.init();

  // -- await splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);

  // firebase initialize
  // testin the app with firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

    /*
     use then function
     and after this we will use AuthenticationRepository
     it will check the current state of the user before re directed to the next screen
     */
  ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  runApp(const App());
}
