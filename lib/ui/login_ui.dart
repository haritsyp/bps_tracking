import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:bps_tracking/apiservice.dart';
import 'package:flutter/services.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:permission_handler/permission_handler.dart';


GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
//GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
ProgressDialog pr;

class LoginPage extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  bool hidePass = true;

  // ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    checkConnection();
  }

  void checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
    } else {

    }
  }

  void _showDialog(title, text) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
          content: new Text(text),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Tutup"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  
  void _showPass() {
    setState(() {
      hidePass = !hidePass;
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var redColor = Color.fromARGB(232, 80, 91, 1);
    pr = new ProgressDialog(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    var labelText = TextStyle(
      color: Colors.grey,
      // fontSize: mediaQuery.size.width > 400 ? 16.0 : 12.0,
    );
    var boldText = TextStyle(
      color: Colors.black,
      fontSize: 28,
      fontWeight: FontWeight.bold
    );
    var normalText = TextStyle(
      color: Colors.black,
      fontSize: 20,
    );
     var emailField = TextField(
       controller: emailController,
       style: TextStyle(color: Colors.grey),
       obscureText: false,
       keyboardType: TextInputType.text,
       decoration: InputDecoration(
          // contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          contentPadding: EdgeInsets.all(15.0),
          prefixIcon: Icon(Icons.account_circle, color: Colors.grey),
          /* prefixIcon: Padding(
            padding: EdgeInsets.only(right: 30, left: 20),
            child: Icon(Icons.account_circle, color: Colors.grey),
          ), */
          labelText: "Username",
          labelStyle: labelText,
          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.red))
          //OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
       ),
    );
    var passwordField = TextField(
        controller: passwordController,
        style: TextStyle(color: Colors.grey),
        obscureText: hidePass,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(40.0, 15.0, 20.0, 15.0),
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.grey),
          suffixIcon: IconButton(
              icon: hidePass ? Icon(Icons.visibility, color: Colors.grey) : Icon(Icons.visibility_off, color: Colors.grey),
              onPressed: () {
                _showPass();
              }),
          labelText: "Password",
          labelStyle: labelText,
          hintStyle: TextStyle(fontWeight: FontWeight.bold),
          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.red))
      )
    );
    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.red[400],
      child: MaterialButton(
        minWidth: mediaQuery.size.width,
        onPressed: () async {
          Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.notification]);
          var connectivityResult = await (Connectivity().checkConnectivity());
          if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
            if(emailController.text != '' && passwordController.text != ''){
              String username = emailController.text.toString();
              String password = passwordController.text.toString();
              //User mhs = User(nim: username, pin: password);
              pr.style(message: 'Login');
              pr.show();

              if(username == 'owner'){
                Navigator.of(context).pushReplacementNamed('/ownerhome');
              }else{
                Navigator.of(context).pushReplacementNamed('/home');
              }

              //Navigator.of(context).pushReplacementNamed('/home');
              /* apiService.loginUser(mhs).then((isSuccess) {
                if (isSuccess == "success") {
                  pr.hide();
                  Navigator.of(context).pushReplacementNamed('/home');
                } else {
                  pr.hide();
                  _scaffoldState.currentState.showSnackBar(SnackBar(
                    content: Text(isSuccess),
                  ));
                }
              }); */

            }
            else {
              _showDialog("Peringatan", "Username/password tidak boleh kosong");
            }
          } else {
              _scaffoldState.currentState.showSnackBar(SnackBar(
                content: Text("Tidak ada koneksi internet"),
              ));
          }
        },
        child: Text(
            "LOGIN",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: mediaQuery.size.width > 400 ? 20.0 : 16.0,)),
      ),
    );

    return Scaffold(
      key: _scaffoldState,
      //backgroundColor: const Color.fromRGBO(255, 230, 230, 1.0),
      // backgroundColor: Colors.blueGrey,
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          width: mediaQuery.size.width,
        /* decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg-with-logo.jpg"),
            fit: BoxFit.cover,
          ),
        ), */
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              //shrinkWrap: true,
              //padding: Padding(),
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Image.asset('resources/logo_text.png', width: mediaQuery.size.width - 80,),
                    ),
                    /* Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('Best Plating Solution', style: boldText,),
                        Text('Sistem karyawan terpusat', style: normalText,)
                    ],) */
                ]),
                Center(
                  child: Image.asset('resources/login_img.png', width: mediaQuery.size.height/3,),
                ),
                // SvgPicture.asset("resources/login_img.svg"),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        emailField,
                        SizedBox(
                          height: 15.0,
                        ),
                        passwordField,
                        SizedBox(
                          height: 10.0,
                        ),
                        loginButton
                      ],
                    ),
                  ),
                ),
                Text('Lupa Password?', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 25.0,
                ),
                Text('Versi 1.0', style: TextStyle(color: Colors.grey, ),)
              ],
            ),
          ),
        ),
      )
      )
    );
  }

  Widget showSuccess(){
    return Column(
      children: <Widget>[
        SizedBox(
          height: 200.0,
          child: Stack(
            children: <Widget>[
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                  child: new CircularProgressIndicator(
                    strokeWidth: 15,
                    value: 1.0,
                  ),
                ),
              ),
              Center(child: Text("Success login. Please wait")),
            ],
          ),
        ),
      ],
    );
  }
}
