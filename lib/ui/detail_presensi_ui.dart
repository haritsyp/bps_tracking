import 'package:bps_tracking/ui/home_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sweetalert/sweetalert.dart';

SharedPreferences preferences;

class PresensiPage extends StatefulWidget {
  const PresensiPage({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _PresensiState();
  }
}

class _PresensiState extends State<PresensiPage> {
  var _current = 0;
  String nama;
  //ApiService apiService;
  
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    TextStyle fontJudul = TextStyle(
      fontFamily: 'Asap',
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      color: Colors.black,
    );
    TextStyle fontIsi = TextStyle(
      fontFamily: 'Asap',
      fontSize: 20,
    );
    TextStyle textButton = TextStyle(
      color: Colors.white
    );
    TextStyle boldText = TextStyle(
      fontWeight: FontWeight.bold
    );
    TextStyle clockText = TextStyle(
      fontSize: 28,
      letterSpacing: 2,
      fontWeight: FontWeight.bold,
      color: Colors.red[300]
    );
    var normalText = TextStyle(
      fontFamily: 'Asap',
      color: Colors.black,
      fontSize: 20,
    ); 
    DateTime now = DateTime.now();
    // String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
    String formattedDate = DateFormat('hh:mm').format(now);
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Presensi', style: fontJudul,),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Container(
            // height: mediaQuery.size.height - 32,
            // height: screenHeightExcludingToolbar(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  heightFactor: 4,
                  child: Text(formattedDate, style: clockText,),
                ),
                Text('Lokasi Anda', style: boldText,),
                Text('Jl. Granit Nila C-26, Driyorejo, Kabupaten Gresik, Jawa Timur'),
                Text('Rencana Kegiatan', style: boldText,),
                TextField(
                  maxLines: 4,
                  //decoration: InputDecoration.collapsed(hintText: "Enter your text here"),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      // contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      contentPadding: EdgeInsets.all(15.0),
                      /* prefixIcon: Padding(
                        padding: EdgeInsets.only(right: 30, left: 20),
                        child: Icon(Icons.account_circle, color: Colors.grey),
                      ), */
                      hintText: "Enter your text here",
                      //labelStyle: labelText,
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.red))
                      //OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                  ),
                ),
                Text('Rencana Kegiatan', style: boldText,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      width: (mediaQuery.size.width/2),
                      child: Text('Masukkan foto diri anda agar kami tahu anda telah siap kerja bersama kami',
                    softWrap: true,maxLines: 4,)
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.red[300]
                      ),
                      width: (mediaQuery.size.width/3),
                      child: Center(child: Text('+ Tekan Di Sini Untuk Membuka Kamera',
                      textAlign: TextAlign.center,)),
                    )
                  ],
                ),
                MaterialButton(
                  onPressed: (){
                    //
                    SweetAlert.show(context,
                      title: "Sukses",
                      subtitle: "Data Terkirim",
                      style: SweetAlertStyle.success,
                      onPress: (bool isConfirm){
                        Navigator.pop(context);
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                      });
                  },
                  minWidth: mediaQuery.size.width - 30,
                  color: Colors.red[300],
                  child: Text('KIRIM', style: textButton),
                  elevation: 1,
                ),
                MaterialButton(
                  onPressed: (){
                    //
                    Navigator.pop(context);
                  },
                  minWidth: mediaQuery.size.width - 30,
                  child: Text('KEMBALI', style: TextStyle(color: Colors.red[300])),
                  color: Colors.white,
                  elevation: 1,
                ),
              ],
            ),
          )
        )
      ),
      
    );
  }

  Size screenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}
double screenHeight(BuildContext context,
    {double dividedBy = 1, double reducedBy = 0.0}) {
  return (screenSize(context).height - reducedBy) / dividedBy;
}
double screenWidth(BuildContext context,
    {double dividedBy = 1, double reducedBy = 0.0}) {
  return (screenSize(context).width - reducedBy) / dividedBy;
}
double screenHeightExcludingToolbar(BuildContext context,
    {double dividedBy = 1}) {
  return screenHeight(context, dividedBy: dividedBy, reducedBy: kToolbarHeight);
}

}

