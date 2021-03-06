import 'package:flutter/material.dart';
import 'package:get/get.dart';

const blueLightColor = Color(0xFFC7B8F5);
const shadowColor = Color(0xFFE6E6E6);

final List<String> managerMenuItems = ['Home', 'Laporan', 'About'];
final List<String> adminMenuItems = ['Home', 'Barang', 'Merek', 'Distributor', "About", "Setting"];
final List<String> kasirMenuItems = ['Home', 'Transaksi'];

final List<IconData> adminMenuIcons = [
  Icons.home_outlined,
  Icons.devices_other_outlined,
  Icons.museum_outlined,
  Icons.store_mall_directory_outlined,
  Icons.account_box_outlined,
  Icons.settings,
];
final List<IconData> managerMenuIcons = [
  Icons.home_outlined,
  Icons.assessment_outlined,
  Icons.account_box_outlined,
];
final List<IconData> kasirMenuIcons = [
  Icons.home_outlined,
  Icons.payment,
];

class SideBar {
  static double xoffset = 0;
  static double yoffset = 0;
  static double pageScale = 1;
  static bool sidebarOpen = false;
  static int selectedMenuItem = 0;

  static void setPageAdmin() {
    switch (selectedMenuItem) {
      case 0:
        Get.offNamed('/home');
        break;
      case 1:
        Get.offNamed('/barang');
        break;
      case 2:
        Get.offNamed('/merek');
        break;
      case 3:
        Get.offNamed('/distributor');
        break;
      case 4:
        Get.offNamed('/pegawai');
        break;
      case 5:
        Get.offNamed('/setting');
        break;
    }
  }

  static void setPageManager() {
    switch (selectedMenuItem) {
      case 0:
        Get.offNamed('/home');
        break;
      case 1:
        Get.offNamed('/laporan');
        break;
      case 2:
        Get.offNamed('/pegawai');
        break;
    }
  }

  static void setPageKasir() {
    switch (selectedMenuItem) {
      case 0:
        Get.offNamed('/home');
        break;
      case 1:
        Get.offNamed('/transaksi');
        break;
    }
  }
}
