import 'package:argon_flutter/API/restAPI.dart';
import 'package:argon_flutter/models/books.dart';
import 'package:argon_flutter/screens/item.dart';
import 'package:argon_flutter/widgets/card-shopping.dart';
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
          return Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            height: 220,
            width: double.maxFinite,
            child: Card(
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 2.0,
                    ),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.all(7),
                  child: Stack(children: <Widget>[
                    Align(
                      alignment: Alignment.centerRight,
                      child: Stack(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(left: 5, top: 5),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Image(
                                        image: NetworkImage(books[index].cover),
                                        width: 150,
                                      ),
                                      SizedBox(
                                        width: 20,
                                        height: 30,
                                      ),
                                      Text(
                                        books[index].namabuku +
                                            books[index].cover,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11),
                                      )
                                    ],
                                  )
                                ],
                              ))
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            ),
          );
        });
  }
}
