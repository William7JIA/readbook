import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:argon_flutter/constants/Theme.dart';

import 'package:argon_flutter/widgets/drawer-tile.dart';

class AdminMenu extends StatelessWidget {
  final String currentPage;

  AdminMenu({this.currentPage});

  _launchURL() async {
    const url = 'https://creative-tim.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: ArgonColors.white,
      child: Column(children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.85,
            child: SafeArea(
              bottom: false,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 32, top: 30),
                  child: Text('Admin Dashboard'),
                ),
              ),
            )),
        Expanded(
          flex: 3,
          child: ListView(
            padding: EdgeInsets.only(top: 44, left: 16, right: 16),
            children: [
              DrawerTile(
                  icon: Icons.home,
                  onTap: () {
                    if (currentPage != "Dashboard")
                      Navigator.pushReplacementNamed(context, '/dashboard');
                  },
                  iconColor: ArgonColors.primary,
                  title: "Dashboard",
                  isSelected: currentPage == "Dashboard" ? true : false),
              DrawerTile(
                  icon: Icons.account_circle,
                  onTap: () {
                    if (currentPage != "User")
                      Navigator.pushReplacementNamed(context, '/user');
                  },
                  iconColor: ArgonColors.info,
                  title: "User",
                  isSelected: currentPage == "User" ? true : false),
              DrawerTile(
                  icon: Icons.account_circle,
                  onTap: () {
                    if (currentPage != "Product")
                      Navigator.pushReplacementNamed(context, '/product');
                  },
                  iconColor: ArgonColors.info,
                  title: "Product",
                  isSelected: currentPage == "Product" ? true : false),
              DrawerTile(
                  icon: Icons.account_circle,
                  onTap: () {
                    if (currentPage != "Logout")
                      Navigator.pushReplacementNamed(context, '/logout');
                  },
                  iconColor: ArgonColors.info,
                  title: "Logout",
                  isSelected: currentPage == "Logout" ? true : false),
            ],
          ),
        ),
      ]),
    ));
  }
}
