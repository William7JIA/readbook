import 'package:argon_flutter/API/restAPI.dart';
import 'package:argon_flutter/models/books.dart';
import 'package:argon_flutter/screens/item.dart';
import 'package:argon_flutter/widgets/card-shopping.dart';
import 'package:argon_flutter/widgets/customcard.dart';
import 'package:flutter/material.dart';
import 'package:argon_flutter/constants/Theme.dart';
//widgets
import 'package:argon_flutter/widgets/navbar.dart';
import 'package:argon_flutter/widgets/card-horizontal.dart';
import 'package:argon_flutter/widgets/card-small.dart';
import 'package:argon_flutter/widgets/card-square.dart';
import 'package:argon_flutter/widgets/drawer.dart';
import 'package:http/http.dart' as http;

class Home extends StatelessWidget {
  // var itemBooks = BookItem();
  // final GlobalKey _scaffoldKey = new GlobalKey();
  final List<Book> futureAlbum;

  const Home({Key key, this.futureAlbum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "Home",
          searchBar: true,
        ),
        backgroundColor: ArgonColors.bgColorScreen,
        // key: _scaffoldKey,
        drawer: ArgonDrawer(currentPage: "Home"),
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
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return CustomCard(
              body: books[index].namabuku,
              stock: true,
              price: books[index].harga.toString(),
              img: books[index].cover,
              readPress: () {});
        });
  }
}
