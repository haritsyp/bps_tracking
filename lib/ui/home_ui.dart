import 'package:bps_tracking/ui/maps_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences preferences;

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomePage> {
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
      fontStyle: FontStyle.italic
    );
    TextStyle fontIsi = TextStyle(
      fontFamily: 'Asap',
      fontSize: 20,
      fontStyle: FontStyle.italic
    );
    TextStyle textButton = TextStyle(
      color: Colors.white
    );
    TextStyle boldText = TextStyle(
      fontWeight: FontWeight.bold
    );
    
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
          // padding: EdgeInsets.only(bottom: 16.0),
          children: <Widget>[
          Container(
            color: Colors.amber,
            // height: 300,
            width: mediaQuery.size.width,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Image.asset('resources/logo_text.png', width: mediaQuery.size.width/2,),
                      IconButton(
                        icon: Icon(Icons.exit_to_app),
                        tooltip: 'Logout',
                        onPressed: () {
                          setState(() {
                            // _volume += 10;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Selamat Datang,', style: fontJudul,),
                          Text('Rinaldy Siwy', style: fontIsi,),
                          SizedBox(height: 10,),
                          MaterialButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => GoogleMapsPage()));
                              },
                              color: Colors.red[300],
                              minWidth: 150,
                              elevation: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(Icons.fingerprint, color: Colors.white,),
                                  SizedBox(width: 10,),
                                  Text('ISI PRESENSI', style: textButton)
                              ],)
                            ),
                      ]),
                      Image.asset('resources/siwy.png', width: 125,),
                      SizedBox(width: 40,)
                    ],
                  ),
                ]
              )
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left:10, top:10),
              child: Text('Histori Kegiatan', style: boldText,),
          ),
          _buildListView(mediaQuery),
          SizedBox(height: 60,)
          /* Expanded(
            child: _buildListView(mediaQuery)
          ,) */
        ]),
        )
      ),
      floatingActionButton: Container(
        width: mediaQuery.size.width - 50,
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => GoogleMapsPage()));
          },
          label: Text('LAPOR KEGIATAN'),
          // icon: Icon(Icons.fingerprint),
          backgroundColor: Colors.red[300],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)))
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildListView(MediaQueryData mediaQuery) {
    return Padding(
      // padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
      // color: Colors.blue,
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
        return Card(
          borderOnForeground: true,
          // shape: Rectangle(left, top, width, height),
          child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Kegiatan'+index.toString()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Kegiatan'+index.toString()),
                  Text('Kegiatan'+index.toString()),
                  Text('Kegiatan'+index.toString()),
              ],)
            ],
          ),
          )
        );
      },
      itemCount:12,
      ),
    );
  }

}

