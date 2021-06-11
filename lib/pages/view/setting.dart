import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_flutter/const.dart';
import 'package:pos_flutter/services/auth_services.dart';
import 'package:pos_flutter/services/provider.dart';
import 'package:pos_flutter/widgets/page_header.dart';
import 'package:pos_flutter/widgets/search_widget.dart';
import 'package:pos_flutter/widgets/side_bar.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  void setSidebarState() {
    setState(() {
      SideBar.xoffset = SideBar.sidebarOpen ? 265 : 0;
      SideBar.yoffset = SideBar.sidebarOpen ? 70 : 0;
      SideBar.pageScale = SideBar.sidebarOpen ? 0.8 : 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final settingProvider = Provider.of<SettingProvider>(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFB1F2B36),
        ),
        child: Container(
          child: Stack(
            children: [
              SideBarMenu(),
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                transform: Matrix4.translationValues(
                    SideBar.xoffset, SideBar.yoffset, 1.0)
                  ..scale(SideBar.pageScale),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: SideBar.sidebarOpen
                      ? BorderRadius.circular(20)
                      : BorderRadius.circular(0),
                ),
                child: Stack(
                  children: [
                    PageHeader(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 24.0),
                          height: 60.0,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  SideBar.sidebarOpen = !SideBar.sidebarOpen;
                                  setSidebarState();
                                },
                                child: Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: Icon(Icons.menu),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FutureBuilder(
                                future: AuthServices.getUserRole(
                                  FirebaseAuth.instance.currentUser.uid,
                                ),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return CircularProgressIndicator();
                                  }
                                  return Container(
                                    child: Text(
                                      'Setting Page',
                                      style: TextStyle(
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 30.0),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 30.0,
                                  vertical: 5.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        settingProvider.colors = Colors.green;
                                      },
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(100),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        settingProvider.colors = Colors.blue;
                                      },
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(100),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        settingProvider.colors = Colors.red;
                                      },
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                            borderRadius: BorderRadius.circular(100),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        settingProvider.colors = Color(0xFFF5CEB8);
                                      },
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF5CEB8),
                                            borderRadius: BorderRadius.circular(100),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
