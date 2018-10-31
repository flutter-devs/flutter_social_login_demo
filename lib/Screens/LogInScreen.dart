import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_social_login/Screens/GoogleScreen.dart';
import 'package:flutter_social_login/Screens/FacebookScreen.dart';
import 'package:flutter_social_login/Screens/TwitterScreen.dart';

//Firebase auth
import 'package:firebase_auth/firebase_auth.dart';

//Google sign in provider
import 'package:google_sign_in/google_sign_in.dart';

//Facebook provider
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

//Twitter provider
import 'package:flutter_twitter_login/flutter_twitter_login.dart';

//Firebase Authentication Instance
final FirebaseAuth _auth = FirebaseAuth.instance;

//Google Sign In Instance
final GoogleSignIn _googleSignIn = new GoogleSignIn();

//Twitter Sign In Instance
final TwitterLogin twitterLogin = new TwitterLogin(
  consumerKey: 'Wk4RkRCE8SpuSgNQucOGRaoaz',
  consumerSecret: 'dszx8pT9VDOedoSG9BHF4pESsL4ehgAuGVvspaJvPmWrMvzHSa',
);

class LogInScreen extends StatefulWidget {

  @override
  LogInScreenState createState() => LogInScreenState();
}

class LogInScreenState extends State<LogInScreen>
    with SingleTickerProviderStateMixin {

  String verificationId;

//Facebook sign in
  FacebookLogin facebookLogin = new FacebookLogin();

  // String googleResult;
  FirebaseUser googleResult;

  Future<FirebaseUser> _googleSignInResult = new Future<FirebaseUser>.value();

  Future<FirebaseUser> __signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final FirebaseUser user = await _auth.signInWithGoogle(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // assert(user.email != null);
    // assert(user.displayName != null);
    // assert(!user.isAnonymous);
    // assert(await user.getIdToken() != null);

    // final FirebaseUser currentUser = await _auth.currentUser();
    // assert(user.uid == currentUser.uid);

    // return 'signInWithGoogle succeeded: $user';
    return user;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: true,
        body: new ListView(
          shrinkWrap: true,
          reverse: false,
          children: <Widget>[

            new SizedBox(
              height: 20.0,
            ),

            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: new Text(
                          "Social Sign In",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                          textAlign: TextAlign.center,
                        ))
                  ],
                ),

                new SizedBox(
                  height: 30.0,
                ),

                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Image.asset(
                      "assets/images/aeologic.png",
                      height: 100.0,
                      width: 200.0,
                      fit: BoxFit.scaleDown,
                    )
                  ],
                ),

                //use future widget for error and result in future

                // new FutureBuilder<String>(
                //     future: _message,
                //     builder: (_, AsyncSnapshot<String> snapshot) {
                //       return new Text(snapshot.data ?? '',
                //           style: const TextStyle(
                //               color: Color.fromARGB(255, 0, 155, 0)));
                //     }),

                new Center(
                    child: new Center(
                  child: new Stack(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(left: 60.0, right: 60.0),
                          child: new Form(
                            autovalidate: false,
                            child: new Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[

                                //Facebook Sign in

                                new Padding(
                                  padding: EdgeInsets.only(
                                      left: 0.0, top: 45.0, bottom: 10.0),
                                  child: new RaisedButton(
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0)),
                                    onPressed: () {
                                      facebookLogin.logInWithReadPermissions([
                                        'email',
                                        'public_profile'
                                      ]).then((result) {
                                        switch (result.status) {
                                          case FacebookLoginStatus.loggedIn:
                                            FirebaseAuth.instance
                                                .signInWithFacebook(
                                                    accessToken: result
                                                        .accessToken.token)
                                                .then((signedInUser) {
                                              print(
                                                  'Signed User ${signedInUser.displayName}');

                                              var root = MaterialPageRoute(
                                                  builder: (context) =>
                                                    new FacebookScreen(signedInUser,facebookLogin));
                                              Navigator.push(context, root);

                                            }).catchError((e) {
                                              print(e);
                                            });
                                            break;
                                          case FacebookLoginStatus
                                              .cancelledByUser:
                                            print('Cancelled by user');
                                            break;
                                          case FacebookLoginStatus.error:
                                            print('Error');
                                            break;
                                        }
                                      }).catchError((e) {
                                        print(e);
                                      });
                                    },
                                    child: new Row(
                                      children: <Widget>[
                                        new Image.asset(
                                          "assets/images/facebook.png",
                                          height: 24.0,
                                          width: 24.0,
                                          fit: BoxFit.scaleDown,
                                        ),
                                        new Image.asset(
                                          "assets/images/substract.png",
                                          height: 24.0,
                                          width: 24.0,
                                          fit: BoxFit.scaleDown,
                                        ),
                                        new Text(
                                          "Facebook",
                                          style: new TextStyle(fontSize: 20.0),
                                        ),
                                      ],
                                    ),
                                    color: Color(0xFF3A559F),
                                    textColor: Colors.white,
                                    elevation: 5.0,
                                    padding: EdgeInsets.only(
                                        left: 30.0,
                                        right: 30.0,
                                        top: 10.0,
                                        bottom: 10.0),
                                  ),
                                ),

                                //Twitter Sign in

                                new Padding(
                                  padding: EdgeInsets.only(
                                      left: 0.0, top: 15.0, bottom: 10.0),
                                  child: new RaisedButton(
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0)),
                                    onPressed: () {
                                      twitterLogin.authorize().then((result) {
                                        switch (result.status) {
                                          case TwitterLoginStatus.loggedIn:
                                            FirebaseAuth.instance
                                                .signInWithTwitter(
                                                    authToken:
                                                        result.session.token,
                                                    authTokenSecret:
                                                        result.session.secret)
                                                .then((signedInUser) {
                                              print(
                                                  'Signed in as ${signedInUser.displayName}');

                                              var root = MaterialPageRoute(
                                                  builder: (context) =>
                                                      new TwitterScreen(
                                                          signedInUser,twitterLogin));
                                              Navigator.push(context, root);
                                            }).catchError((e) {
                                              print(e);
                                            });
                                            break;

                                          case TwitterLoginStatus
                                              .cancelledByUser:
                                            print('Cancelled by user');
                                            break;

                                          case TwitterLoginStatus.error:
                                            print('Error');
                                            break;
                                        }
                                      }).catchError((e) {
                                        print(e);
                                      });
                                    },
                                    child: new Row(
                                      children: <Widget>[
                                        new Image.asset(
                                          "assets/images/twitter.png",
                                          height: 24.0,
                                          width: 24.0,
                                          fit: BoxFit.scaleDown,
                                        ),
                                        new Image.asset(
                                          "assets/images/substract.png",
                                          height: 24.0,
                                          width: 24.0,
                                          fit: BoxFit.scaleDown,
                                        ),
                                        new Text(
                                          "Twitter",
                                          style: new TextStyle(fontSize: 20.0),
                                        ),
                                      ],
                                    ),
                                    color: Color(0xFF26A6D1),
                                    textColor: Colors.white,
                                    elevation: 5.0,
                                    padding: EdgeInsets.only(
                                        left: 30.0,
                                        right: 30.0,
                                        top: 10.0,
                                        bottom: 10.0),
                                  ),
                                ),

                                //Google Sign In

                                new Padding(
                                  padding: EdgeInsets.only(
                                      left: 0.0, top: 15.0, bottom: 10.0),
                                  child: new RaisedButton(
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0)),
                                    onPressed: () {
                                      setState(() {
                                        _googleSignInResult = __signInWithGoogle();

                                        _googleSignInResult.then((result) {
                                          setState(() {
                                            var root = MaterialPageRoute(
                                                builder: (context) =>
                                                    new GoogleScreen(
                                                        result,_googleSignIn));
                                            Navigator.push(context, root);
                                          });
                                        });
                                      });
                                    },
                                    child: new Row(
                                      children: <Widget>[
                                        new Image.asset(
                                          "assets/images/google.png",
                                          height: 24.0,
                                          width: 24.0,
                                          fit: BoxFit.scaleDown,
                                        ),
                                        new Image.asset(
                                          "assets/images/substract.png",
                                          height: 24.0,
                                          width: 24.0,
                                          fit: BoxFit.scaleDown,
                                        ),
                                        new Text(
                                          "Google",
                                          style: new TextStyle(fontSize: 20.0),
                                        ),
                                      ],
                                    ),
                                    color: Colors.white,
                                    textColor: Color(0xFF777777),
                                    elevation: 5.0,
                                    padding: EdgeInsets.only(
                                        left: 30.0,
                                        right: 30.0,
                                        top: 10.0,
                                        bottom: 10.0),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ))
              ],
            )
          ],
        ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed

    super.dispose();
  }
}
