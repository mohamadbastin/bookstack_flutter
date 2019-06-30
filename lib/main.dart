import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'signup.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => SplashScreen(),
      '/signup': (context) => Signup(),
      '/check': (context) => Check(),
    },
    title: 'Flutter Tutorial',
    // home: TutorialHome(),
    theme: ThemeData(primaryColor: Colors.white),
  ));
}

class Signup extends StatelessWidget {
  final myController = TextEditingController();
  // var focusphone = new FocusNode();

  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for the major Material Components.
    return Scaffold(
      // backgroundColor: Color(0xFF414141),
      // backgroundColor: Colors.blueGrey,
      // appBar: AppBar(

      //   backgroundColor: Color(0xFF313131),
      //   leading: IconButton(
      //     icon: Icon(Icons.menu, color: Colors.white,),
      //     tooltip: 'Navigation menu',
      //     onPressed: null,
      //   ),
      //   title: Text('Book Stack', style: TextStyle(color: Colors.white),),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(Icons.search, color: Colors.white),
      //       tooltip: 'Search',
      //       onPressed: null,
      //     ),
      //   ],
      // ),
      // body is the majority of the screen.
      body: new GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: CustomPaint(
              willChange: false,
              size: Size.infinite,
              painter: mypainter(),
              child: Center(
//         child: TextField(
//   decoration: InputDecoration(

//     icon: Icon(Icons.person),
//     border: InputBorder.none,
//     hintText: 'Enter Your Phone Number'
//   ),
// ),

                child: Column(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(30),
                  ),
                  // Container(
                  //   constraints: BoxConstraints(minWidth: 100, maxWidth: 100, minHeight: 25, maxHeight: 25),
                  //   child: Center(child:  Text('Login',style:TextStyle( color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold)))),
                  // Padding(
                  //   padding: EdgeInsets.all(15.0),
                  // ),
                  Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                          // padding: EdgeInsets.only(top: 50, right: 0),
                          // margin: EdgeInsets.only(top: 50, right: 0),

                          alignment: Alignment(0.5, 0.0),
                          child: Image.asset(
                            'images/bookstack_logo_white.png',
                            height: 150,
                          ))),

                  Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: Container(
                        width: 400,
                        alignment: Alignment(-0.7, 0),
                        child: Text(
                          'Create\nAccount',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.all(35),
                  ),

                  Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Container(
                          width: 300,
                          child: TextField(
                            // focusNode: focusphone,
                            controller: myController,
                            textInputAction: TextInputAction.go,
                            style: TextStyle(color: Colors.black),
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.phone,
                                color: Colors.black,
                              ),
                              labelText: 'Enter Your Phone Number',
                              // enabledBorder: UnderlineInputBorder(
                              //     borderSide: BorderSide(color: Colors.black, width: 0.0)),
                              // hintText: 'Enter Your Phone Number',
                              prefix: Text('+98'),
                              hintStyle: TextStyle(color: Colors.black),
                              fillColor: Colors.black,
                            ),
                          )))
                ]),
              ))),
      floatingActionButton: FloatingActionButton.extended(
        highlightElevation: 30,
        tooltip: 'Next', // used by assistive technologies
        icon: Icon(Icons.arrow_forward),
        label: Text('Log In'),
        backgroundColor: Colors.redAccent,
        elevation: 200.0,
        onPressed: () {

          if (myController.text != null &&
              myController.text[0] == "9" &&
              myController.text.length == 10) {

            Map data = {'phone_number': '+98' + myController.text};
            showDialog(
                
                context: context,
                builder: (context) {
                  return AlertDialog(
                    contentPadding: EdgeInsets.all(0.0),
                    titlePadding: EdgeInsets.all(0.0),
                    content: Container(
                      child: Image.asset('images/loader.gif'),
                      height: 100,
                      width: 100,
                    )
                  );
                });
            Future<http.Response> sendnumber() async {
            http.post(
                  'http://bookstack.spsina.ir/api/v1/login/',
                  body: json.encode(data),
                  headers: {
                    "Accept": "application/json",
                    "content-type": "application/json"
                  }).then((http.Response response) {
                    Navigator.pop(context);
                    Navigator.pushNamed(
                      context,
                      '/check',
                    );
                  });

              

              // return showDialog(
              //     context: context,
              //     builder: (context) {
              //       return AlertDialog(
              //         content: Text('done'),
              //       );
              //     });
              
            }

            sendnumber();
          } else {}
        },
      ),
      // bottomNavigationBar: BottomAppBar(
      //   color: Color(0xFFfafafa), child: Container(height: 50,),),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      resizeToAvoidBottomPadding: true,
    );
  }
}

class mypainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();

    Path mainbackground = Path();
    mainbackground.addRect(Rect.fromLTRB(0, 0, width, height));
    paint.color = Color(0xFFfafafa);
    canvas.drawPath(mainbackground, paint);

    Path oval0 = Path();
    oval0.moveTo(width * 0.7, height * 0.39);
    oval0.quadraticBezierTo(width * 0.85, height * 0.5, width, height * 0.5);
    oval0.quadraticBezierTo(width, 0, width, 0);
    oval0.quadraticBezierTo(0, 0, 0, 0);

    oval0.close();
    paint.color = Color(0xFF448ef6);
    canvas.drawPath(oval0, paint);

    Path oval1 = Path();
    oval1.moveTo(0, height * 0.45);
    oval1.quadraticBezierTo(
        width * 0.4, height * 0.5, width * 0.7, height * 0.39);
    oval1.quadraticBezierTo(
        width * 0.85, height * 0.3, width * 0.85, height * 0.2);
    oval1.quadraticBezierTo(width * 0.9, height * 0.05, width, height * 0.1);
    oval1.quadraticBezierTo(width, 0, width, 0);
    oval1.quadraticBezierTo(0, 0, 0, 0);

    oval1.close();
    paint.color = Color(0xFF393e46);
    canvas.drawPath(oval1, paint);

    Path oval = Path();
    oval.moveTo(0, height * 0.2);
    oval.quadraticBezierTo(
        width * 0.17, height * 0.20, width * 0.3, height * 0.1);
    oval.quadraticBezierTo(
        width * 0.35, height * 0.05, width * 0.5, height * 0.05);
    oval.quadraticBezierTo(width * 0.8, height * 0.05, width * 0.85, 0);
    oval.quadraticBezierTo(0, 0, 0, 0);
    oval.close();

    paint.color = Color(0xFFfab95b);
    canvas.drawPath(oval, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate == this;
  }
}

class Check extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text('second page')),
      ),
      floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.arrow_back),
          label: Text('Go Back'),
          backgroundColor: Colors.blueAccent,
          elevation: 200.0,
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }
}

////////////////   SPLASH SCREEN   /////////////////

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () => Navigator.pushNamed(context, '/signup'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.redAccent),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('images/gif.gif'),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        'rfw',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      backgroundColor: Colors.red,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text(
                      'sdvdfvev',
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
