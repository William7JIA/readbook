import 'dart:ui';
import 'package:argon_flutter/widgets/drawer-tile.dart';
import 'package:flutter/material.dart';
import 'package:argon_flutter/constants/Theme.dart';

//widgets
import 'package:argon_flutter/widgets/navbar.dart';
import 'package:argon_flutter/widgets/drawer.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: Navbar(
          title: "Profile",
          transparent: true,
        ),
        backgroundColor: ArgonColors.bgColorScreen,
        drawer: ArgonDrawer(currentPage: "Home"),
        body: Stack(children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment.topCenter,
                      image: AssetImage("assets/img/profile-screen-bg.png"),
                      fit: BoxFit.fitWidth))),
          SafeArea(
            child: ListView(children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 1.0, right: 1.0, top: 74.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: .0,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0))),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 85.0, bottom: 20.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 40.0),
                                      Align(
                                        child: Text("Jessica Jones",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    50, 50, 93, 1),
                                                fontSize: 28.0)),
                                      ),
                                      SizedBox(height: 10.0),
                                      Align(
                                        child: Text("ID :",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    50, 50, 93, 1),
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w200)),
                                      ),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(top: 40),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 10,
                                                    bottom: 10,
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      DrawerTile(
                                                          icon: Icons.list_alt,
                                                          onTap: () {
                                                            Navigator
                                                                .pushReplacementNamed(
                                                                    context,
                                                                    '/profile');
                                                          },
                                                          iconColor: ArgonColors
                                                              .primary,
                                                          title:
                                                              "Detai Pemakaian Koin"),
                                                      DrawerTile(
                                                          icon: Icons.ballot,
                                                          onTap: () {
                                                            Navigator
                                                                .pushReplacementNamed(
                                                                    context,
                                                                    '/profile');
                                                          },
                                                          iconColor: ArgonColors
                                                              .primary,
                                                          title:
                                                              "Tugas Harian"),
                                                      DrawerTile(
                                                          icon: Icons.check,
                                                          onTap: () {
                                                            Navigator
                                                                .pushReplacementNamed(
                                                                    context,
                                                                    '/profile');
                                                          },
                                                          iconColor: ArgonColors
                                                              .primary,
                                                          title:
                                                              "Invite Teman"),
                                                      DrawerTile(
                                                          icon: Icons.logout,
                                                          onTap: () {
                                                            Navigator
                                                                .pushReplacementNamed(
                                                                    context,
                                                                    '/profile');
                                                          },
                                                          iconColor: ArgonColors
                                                              .primary,
                                                          title: "Logout"),
                                                    ],
                                                  )),
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      FractionalTranslation(
                          translation: Offset(0.0, -0.5),
                          child: Align(
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                  "assets/img/profile-screen-avatar.jpg"),
                              radius: 65.0,
                              // maxRadius: 200.0,
                            ),
                            alignment: FractionalOffset(0.5, 0.0),
                          ))
                    ]),
                  ],
                ),
              ),
            ]),
          )
        ]));
  }
}
