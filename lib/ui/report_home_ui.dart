import 'package:bps_tracking/widget/list_karyawan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences preferences;

class OwnerHomePage extends StatefulWidget {
  const OwnerHomePage({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _OwnerHomeState();
  }
}

class _OwnerHomeState extends State<OwnerHomePage> {
  var _current = 0;
  String nama;
  //ApiService apiService;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    TextStyle fontJudul = TextStyle(
        fontFamily: 'Asap',
        fontSize: 28,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic);
    TextStyle fontIsi = TextStyle(
        fontFamily: 'Asap', fontSize: 20, fontStyle: FontStyle.italic);
    TextStyle textButton = TextStyle(color: Colors.white);
    TextStyle boldText = TextStyle(
        fontFamily: 'Asap', fontSize: 18, fontWeight: FontWeight.bold);

    return DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Scaffold(
            body: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(30, 20, 20, 20),
                      child: new Stack(
                        children: <Widget>[
                          Column(children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Image.asset(
                                  'resources/logo_text.png',
                                  width: mediaQuery.size.width / 2,
                                ),
                                IconButton(
                                  icon: Icon(Icons.exit_to_app),
                                  tooltip: 'Logout',
                                  onPressed: () {
                                    // _logout();
                                    Navigator.popUntil(
                                        context, ModalRoute.withName('/'));
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Selamat Datang,',
                                        style: fontJudul,
                                      ),
                                      Text(
                                        'Owner',
                                        style: fontIsi,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ]),
                              ],
                            ),
                          ]),
                          Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 25.0, 40.0, 10.0),
                                child: Image.asset('resources/siwy.png',
                                    height: 110),
                              )),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    color: Colors.red,
                    child: TabBar(
                      indicatorColor: Colors.white,
                      tabs: <Widget>[
                        Tab(text: 'KARYAWAN'),
                        Tab(text: 'STATUS'),
                        Tab(text: 'PRESENSI')
                      ],
                    ),
                  ),
                  Expanded(
                      child: TabBarView(
                    children: <Widget>[
                      SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                new Flexible(
                                    child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Container(
                                    height: 40,
                                    child: new TextField(
                                      style: TextStyle(color: Colors.grey),
                                      obscureText: false,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(10.0),
                                          hintText: 'Cari karyawan',
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.red))),
                                    ),
                                  ),
                                )),
                                Padding(
                                    padding: EdgeInsets.only(right: 20),
                                    child: ButtonTheme(
                                      minWidth: 90.0,
                                      height: 39.0,
                                      child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(4.0)),
                                        color: Colors.red,
                                        onPressed: () {},
                                        child: Text("CARI", style: textButton),
                                      ),
                                    ))
                              ],
                            ),
                            _buildListView(mediaQuery)
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: _buildListView(mediaQuery),
                      ),
                      SingleChildScrollView(
                        child: _buildListView(mediaQuery),
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ),
        ));
  }

  Widget _buildListView(MediaQueryData mediaQuery) {
    return Padding(
        padding: EdgeInsets.only(top: 10),
        child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
                  color: Colors.black,
                ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListKaryawan(
                      'Harits Yulianta Pratama - ' + index.toString(),
                      'Jabatan ' + index.toString(),
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Deddy_Corbuzier%2C_Netmediatama%2C_03.38.jpg/220px-Deddy_Corbuzier%2C_Netmediatama%2C_03.38.jpg'),
                ],
              );
            },
            itemCount: 12));
  }
}
