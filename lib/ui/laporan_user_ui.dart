import 'package:bps_tracking/ui/maps_ui.dart';
import 'package:bps_tracking/ui/maps_laporan_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
SharedPreferences preferences;

class LaporanUserPage extends StatefulWidget {
  const LaporanUserPage({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _LaporanUsetState();
  }
}

class _LaporanUsetState extends State<LaporanUserPage> {
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
      fontFamily: 'Asap',
      fontSize: 18,
      fontWeight: FontWeight.bold
    );
    
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
          // mainAxisSize: MainAxisSize.max,
          // padding: EdgeInsets.only(bottom: 16.0),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('resources/bg_pie.png'),
                // fit: BoxFit.fill,
                alignment: Alignment.topRight
              ),
              // shape: BoxShape.circle,
            ),
            // height: 210,
            // width: mediaQuery.size.width,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Image.asset('resources/logo_text.png', width: mediaQuery.size.width/2,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Kegiatan', style: fontJudul,),
                          Text('Rinaldy Siwy', style: fontIsi,),
                          Text('Jabatan', style: fontIsi,),
                          SizedBox(height: 10,),
                          MaterialButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            color: Colors.red[300],
                            minWidth: 150,
                            elevation: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Icon(Icons.fingerprint, color: Colors.white,),
                                SizedBox(width: 10,),
                                Text('KEMBALI', style: textButton)
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
            // padding: EdgeInsets.only(left:10, top:10),
            padding: EdgeInsets.all(16),
            child: Text('Histori Kegiatan', style: boldText,),
          ),
          _buildListView(mediaQuery),
          
        ]),
        )
      ),
      
    );
  }

  Widget _buildListView(MediaQueryData mediaQuery) {
    return Padding(
      // padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
      // color: Colors.blue,
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.black,
        ),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Kegiatan'+index.toString(), style: TextStyle(fontSize:18),),
              SizedBox(height: 5,),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.local_post_office, size: 16,),
                  Text('16/04/2020'),
                  Spacer(flex: 1,),
                  Icon(Icons.timer, size: 16),
                  Text('09.00'),
                  Spacer(flex: 2,),
                  Icon(Icons.face, size: 16),
                  Text('Customer: Siwy'),
              ],)
            ],
          ),
        );
      },
      itemCount:12,
      ),
    );
  }

}

