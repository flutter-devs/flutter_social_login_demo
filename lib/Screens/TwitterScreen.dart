import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_social_login/Constant/Constant.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'dart:async';


// //Twitter provider
import 'package:flutter_twitter_login/flutter_twitter_login.dart';

//import 'package:fluttertoast/fluttertoast.dart';


class TwitterScreen extends  StatelessWidget {
  TwitterScreen(this.result,this.twitterLogin);
  // String result;
  FirebaseUser result;
  TwitterLogin twitterLogin;

//   @override
//   TwitterScreenState createState() => TwitterScreenState();
// }

// class TwitterScreenState extends State<TwitterScreen>
//     with SingleTickerProviderStateMixin {

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

  Future<String> _message = new Future<String>.value('');
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
                    "Twitter",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: Color(0xFF26A6D1),
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
                color: Color(0xFF26A6D1),
                child: new Text("Sign Out"),
                onPressed: () {
                  twitterLogin.logOut();
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
