import 'package:flutter/material.dart';
import 'package:argon_flutter/constants/Theme.dart';

class CustomCard extends StatelessWidget {
  CustomCard(
      {this.body = "Placeholder Title",
      this.stock = true,
      this.price = "332",
      this.img = "https://via.placeholder.com/200",
      this.readPress});

  final String body;
  final bool stock;
  final String price;
  final String img;
  final Function readPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      // margin: EdgeInsets.only(top: 64),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 110,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(4.0),
                          child: Image.network(img)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                      )),
                ]),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(body,
                        style: TextStyle(
                            color: ArgonColors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w400)),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 1.0),
                            child: Text(
                                stock == true ? 'Book Ready' : 'Book Not Ready',
                                style: TextStyle(
                                    color: stock == true
                                        ? ArgonColors.success
                                        : ArgonColors.error,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text("\Rp$price",
                                style: TextStyle(
                                    color: ArgonColors.primary,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlatButton(
                          textColor: ArgonColors.white,
                          color: ArgonColors.initial,
                          onPressed: () {
                            readPress();
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 5.0, right: 5.0, top: 12, bottom: 12),
                              child: Text("Read",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11.0))),
                        ),
                        FlatButton(
                          textColor: ArgonColors.white,
                          color: ArgonColors.initial,
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 5.0, right: 5.0, top: 12, bottom: 12),
                              child: Text("Buy",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 11.0))),
                        )
                      ],
                    )
                  ]),
            ),
          )
        ]),
      ),
      decoration: BoxDecoration(
        color: ArgonColors.white,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
    );
  }
}
