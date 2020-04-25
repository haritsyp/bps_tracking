import 'package:bps_tracking/ui/home_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sweetalert/sweetalert.dart';

SharedPreferences preferences;

class LaporKegiatanPage extends StatefulWidget {
  const LaporKegiatanPage({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _LapKegiatanState();
  }
}

class _LapKegiatanState extends State<LaporKegiatanPage> {
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
      fontFamily: 'Asap',
      fontSize: 20,
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
      color: Colors.grey,
      fontSize: 16,
    );
    var photoText = TextStyle(
      fontFamily: 'Asap',
      color: Colors.red[300],
      fontSize: 14,
    );
    DateTime now = DateTime.now();
    // String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
    String formattedDate = DateFormat('kk:mm').format(now);
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Laporan', style: fontJudul,),
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
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  heightFactor: 3,
                  child: Text(formattedDate, style: clockText,),
                ),
                Row(children: <Widget>[
                  Icon(Icons.location_on),
                  SizedBox(width: 10,),
                  Text('Lokasi Anda', style: boldText,),
                ],),
                SizedBox(height: 10,),
                Text('Jl. Granit Nila C-26, Driyorejo, Kabupaten Gresik, Jawa Timur', style: normalText),
                SizedBox(height: 10,),
                Row(children: <Widget>[
                  Icon(Icons.business),
                  SizedBox(width: 10,),
                  Text('Rencana Kegiatan', style: boldText,),
                ],),
                SizedBox(height: 10,),
                TextField(
                  maxLines: 4,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(16.0),
                      hintText: "Tuliskan kegiatan yang sedang anda lakukan",
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.red))
                  ),
                ),
                SizedBox(height: 10,),
                Row(children: <Widget>[
                  Icon(Icons.business),
                  SizedBox(width: 10,),
                  Text('Customer', style: boldText,),
                ],),
                SizedBox(height: 10,),
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(16.0),
                      hintText: "Masukkan nama customer disini",
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.red))
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  maxLines: 4,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(16.0),
                      hintText: "Ceritakan tanggapan customer anda",
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.red))
                  ),
                ),
                SizedBox(height: 10,),
                Row(children: <Widget>[
                  Icon(Icons.camera_alt),
                  SizedBox(width: 10,),
                  Text('Foto Bukti Kegiatan', style: boldText,),
                ],),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: (mediaQuery.size.width/2),
                      child: Text('Masukkan foto bukti yang mewakili kegiatan yang anda lakukan saat ini \n\nContoh: Nota/e-Receipt, Log Panggilan dengan customer, dll', style: normalText,
                    softWrap: true,)
                    ),
                    Column(children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red[300]),
                        ),
                        width: 150,
                        height: 150,
                        child: Center(child: Text('+ Tekan Di Sini Untuk Mengambil Foto', style: photoText,
                        textAlign: TextAlign.center,)),
                      ),
                      FlatButton(
                        onPressed: (){
                          //
                        },
                        child: Text('Edit', style: photoText,),
                      ),
                    ])
                  ],
                ),
                SizedBox(height: 10,),
                MaterialButton(
                  onPressed: (){
                    //
                    SweetAlert.show(context,
                      title: "Sukses",
                      subtitle: "Data Terkirim",
                      style: SweetAlertStyle.success,
                      onPress: (bool isConfirm){
                        return true;
                        // Navigator.pop(context);
                        // Navigator.of(context).pushReplacementNamed('/home');
                        // Navigator.popUntil(context, ModalRoute.withName('/home'));
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

