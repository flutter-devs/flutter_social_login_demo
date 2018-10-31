import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

// //Facebook provider
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
// 
class FacebookScreen extends StatelessWidget {
  FacebookScreen(this.result,this.fbLogin);
  // String result;
  FirebaseUser result;
  FacebookLogin fbLogin;

//   @override
//    FacebookScreenState createState() =>  FacebookScreenState();
// }

// class  FacebookScreenState extends State< FacebookScreen>
//     with SingleTickerProviderStateMixin {

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

  // Future<String> _message = new Future<String>.value('');
  String verificationId;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        // resizeToAvoidBottomPadding: true,
        body:
            // new ListView(
            //   shrinkWrap: true,
            //   reverse: false,
            //   children: <Widget>[
            //     new SizedBox(
            //       height: 20.0,
            //     ),
            new Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 0.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: new Text(
                    "Facebook",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: Color(0xFF3A559F),
                    ),
                    textAlign: TextAlign.center,
                  ))
            ],
          ),
        ),

        //   new Image.network(result.photoUrl,
        //   width: 250.0,
        // ),

        new Center(
          child: new Column(
            children: <Widget>[
              new CircleAvatar(
                backgroundImage: new NetworkImage(
                  (result.photoUrl),
                ),
                radius: 60.0,
              ),
              Padding(
                  padding: EdgeInsets.only(bottom: 20.0, top: 20.0),
                  child: new Text(
                    // result.displayName + "\n" + result.email,
                    result.displayName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.center,
                  )),

                   new RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                padding: const EdgeInsets.all(8.0),
                textColor: Colors.white,
                color: Color(0xFF3A559F),
                child: new Text("Sign Out"),
                onPressed: () {
                  fbLogin.logOut();
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  } else {
                    // SystemNavigator.pop();
                  }
                },
              )

            ],
          ),
        )
      ],
    )
        // ],
        // )
        );
  }
}
