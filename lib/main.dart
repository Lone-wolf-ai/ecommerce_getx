import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_ecommerce/binding/general_binding.dart';
import 'package:getx_ecommerce/data/repo/authintication/auth_repository.dart';
import 'package:getx_ecommerce/firebase_options.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/theme/theme.dart';

Future<void> main() async {
  //todo:add widget binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  //todo: init local storage
  await GetStorage.init();
  //todo: init payment method
  //todo: await native splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //todo: initialize firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthintaicationRepository()));
  //app check
  await FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.appAttest,
  );
  //todo: intialize authintication
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppRoutes.pages,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: CustomThemeData.lightheme,
      initialBinding: GeneralBinding(),
      darkTheme: CustomThemeData.darktheme,
      home: const Scaffold(
        backgroundColor: CustomColour.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: CustomColour.white,
          ),
        ),
      ),
    );
  }
}
