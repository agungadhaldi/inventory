import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_flutter/pages/view/barang_page.dart';
import 'package:pos_flutter/pages/view/distributor_page.dart';
import 'package:pos_flutter/pages/view/home_page.dart';
import 'package:pos_flutter/pages/view/laporan_page.dart';
import 'package:pos_flutter/pages/view/login_page.dart';
import 'package:pos_flutter/pages/view/merek_page.dart';
import 'package:pos_flutter/pages/view/pegawai_page.dart';
import 'package:pos_flutter/pages/view/transaksi_page.dart';
import 'package:pos_flutter/services/auth_services.dart';
import 'package:pos_flutter/services/provider.dart';
import 'package:pos_flutter/services/user_validation.dart';
import 'package:provider/provider.dart';

import 'pages/view/register_page.dart';
import 'pages/view/setting.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      initialData: null,
      value: AuthServices.firebaseUserStream,
      child: ChangeNotifierProvider(
        create: (context) => SettingProvider(),
        child: Consumer<SettingProvider>(
          builder: (context, setting, _) =>
          GetMaterialApp(
            theme: ThemeData(
              brightness: setting.settingBrightness,
            ),
            debugShowCheckedModeBanner: false,
            title: 'Inventaris',
            initialRoute: '/',
            getPages: [
              GetPage(
                name: '/',
                page: () => UserValidation(),
              ),
              GetPage(
                name: '/home',
                page: () => HomePage(),
              ),
              GetPage(
                name: '/login',
                page: () => LoginPage(),
              ),
              GetPage(
                name: '/register',
                page: () => RegisterPage(),
              ),
              GetPage(
                name: '/barang',
                page: () => BarangPage(),
              ),
              GetPage(
                name: '/merek',
                page: () => MerekPage(),
              ),
              GetPage(
                name: '/distributor',
                page: () => DistributorPage(),
              ),
              GetPage(
                name: '/laporan',
                page: () => LaporanPage(),
              ),
              GetPage(
                name: '/pegawai',
                page: () => PegawaiPage(),
              ),
              GetPage(
                name: '/transaksi',
                page: () => TransaksiPage(),
              ),
              GetPage(
                name: '/setting',
                page: () => SettingPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
