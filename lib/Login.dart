import 'package:ReadyToKnow/Dashboard.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Utilities.dart';

class Login extends StatelessWidget {
  Login({Key key, this.isSignInParam = true}) : super(key: key);
  final bool isSignInParam;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/dashboard': (context) => Dashboard(),
        // // When navigating to the "/second" route, build the SecondScreen widget.
        // '/second': (context) => SecondScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(isSignIn: isSignInParam),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.isSignIn = false}) : super(key: key);

  final bool isSignIn;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
        Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[buildEnterButton()]))
      ],
    );
  }

  Widget buildORText() {
    return Column(
      children: <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
            color: Colors.white38,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget buildLogin() {
    return Container(
        child: RichText(
      text: TextSpan(
          style: TextStyle(
            color: Colors.white54,
            letterSpacing: 1.5,
            fontSize: 19.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
          children: <TextSpan>[
            TextSpan(text: 'Click here to '),
            TextSpan(
                text: widget.isSignIn ? "Login" : "Sign In",
                style: TextStyle(
                  color: Colors.white54,
                  letterSpacing: 1.5,
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Login(isSignInParam: !widget.isSignIn);
                    }));
                  }),
          ]),
    ));
  }

  Widget buildEnterButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      width: 100.0,
      child: RaisedButton(
          elevation: 5.0,
          onPressed: () {
            Navigator.pushNamed(context, '/dashboard');
          },
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: Colors.white,
          child: Icon(
            Icons.arrow_forward,
            color: Color(0xFF527DAA),
            size: 30.0,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        widget.isSignIn ? "Sign In" : "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      buildEmail(),
                      SizedBox(
                        height: 30.0,
                      ),
                      buildPassword(),
                      SizedBox(
                        height: 70.0,
                      ),
                      buildORText(),
                      SizedBox(
                        height: 10.0,
                      ),
                      buildLogin(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
