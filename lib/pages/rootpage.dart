import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:sikada/config/colors.dart';
import 'package:sikada/features/legalize/legalize.dart';
import 'package:sikada/features/report/myreports.dart';
import 'package:sikada/features/sessions/session_vm.dart';
import 'package:sikada/features/map/map_view.dart';
import 'package:sikada/pages/Home/homepage.dart';
import 'package:sikada/pages/profile/profileview.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _bottomNavIndex = 0;
  final SessionVM controller = Get.find<SessionVM>();

  @override
  Widget build(BuildContext context) {
    //Icons
    List iconList = [Icons.home, Icons.work, Icons.location_on, Icons.person];
    //Page Names
    List page_name = ['Home', "Sessions", "Map", "Profile"];
    //Pages
    List<Widget> pages = [
      HomePage(),
      controller.getPage(),
      MapView(),
      ProfileSettingsPage(),
    ];

    return Scaffold(
      backgroundColor: AppColors.to.background,
      body: IndexedStack(index: _bottomNavIndex, children: pages),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.add_event,
        animatedIconTheme: IconThemeData(
          size: 30, // Augmente la taille de l'icône
          color: Colors.black, // Change la couleur en blanc
        ),
        backgroundColor: AppColors.to.background,
        children: [
          SpeedDialChild(
            labelStyle: TextStyle(fontSize: 12),
            child: Icon(Icons.flag, color: AppColors.to.keyLight),
            label: "My Reports",
            backgroundColor: Color.fromARGB(255, 230, 235, 234),
            onTap: () {
              Get.to(MyReportsPage());
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.edit_document, color: AppColors.to.keyLight),
            label: "Legalize my spot",
            labelStyle: TextStyle(fontSize: 12),
            backgroundColor: Color.fromARGB(255, 230, 235, 234),
            onTap: () {
              Get.to(Legalize());
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        height: 60,
        itemCount: 4,
        tabBuilder: (int index, bool isActive) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 6),
                child: Icon(
                  iconList[index],
                  size: 28,
                  color: _bottomNavIndex == index
                      ? AppColors.to.keyLight
                      : Colors.grey,
                ),
              ),
              Text(
                page_name[index],
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 11),
              ),
            ],
          );
        },
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,

        onTap: (index) => setState(() {
          _bottomNavIndex = index;
        }),
        //other params
      ),
    );
  }
}
