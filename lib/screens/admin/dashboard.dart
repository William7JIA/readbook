import 'package:argon_flutter/API/restAPI.dart';
import 'package:argon_flutter/models/books.dart';
import 'package:argon_flutter/screens/item.dart';
import 'package:argon_flutter/widgets/card-shopping.dart';
import 'package:argon_flutter/widgets/menuadmin.dart';
import 'package:flutter/material.dart';
import 'package:argon_flutter/constants/Theme.dart';
//widgets
import 'package:argon_flutter/widgets/navbar.dart';
import 'package:argon_flutter/widgets/card-horizontal.dart';
import 'package:argon_flutter/widgets/card-small.dart';
import 'package:argon_flutter/widgets/card-square.dart';
import 'package:argon_flutter/widgets/drawer.dart';
import 'package:http/http.dart' as http;

String imgURL = "https://restfull-tokobuku.herokuapp.com/assets/";

class Dashboard extends StatelessWidget {
  // var itemBooks = BookItem();
  // final GlobalKey _scaffoldKey = new GlobalKey();
  final List<Book> futureAlbum;

  const Dashboard({Key key, this.futureAlbum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "Dashboard",
        ),
        backgroundColor: ArgonColors.bgColorScreen,
        // key: _scaffoldKey,
        drawer: AdminMenu(currentPage: "Home"),
        body: FutureBuilder(
            future: fetchBooks(http.Client()),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);

              return snapshot.hasData
                  ? ListItem(books: snapshot.data)
                  : Center(child: CircularProgressIndicator());
            }));
  }
}

class ListItem extends StatelessWidget {
  final List<Book> books;
  const ListItem({Key key, this.books}) : super(key: key);
  @override
  Widget build(BuildContext context) {}
}
