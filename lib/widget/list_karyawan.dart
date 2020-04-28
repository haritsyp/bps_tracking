import 'package:flutter/material.dart';

class ListKaryawan extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  const ListKaryawan(this.title, this.subtitle, this.image);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Container(
            child: Row(
              children: <Widget>[
                new Container(
                  alignment: Alignment.centerLeft,
                  child: new ClipRRect(
                    borderRadius: new BorderRadius.circular(500.0),
                    child: new Image.network(
                      image,
                      height: 36,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                new Container(
                    margin:
                        EdgeInsets.only(right: 0, left: 20, top: 3, bottom: 3),
                    width: MediaQuery.of(context).size.width - 100,
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          style: new TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'Roboto',
                            color: new Color(0xFF212121),
                          ),
                        ),
                        new Text(
                          subtitle,
                          overflow: TextOverflow.ellipsis,
                          style: new TextStyle(
                            fontSize: 12.0,
                            fontFamily: 'Roboto',
                            color: new Color(0xFF212121),
                          ),
                        ),
                      ],
                    )),
              ],
            )));
  }
}
