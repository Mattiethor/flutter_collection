import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  // Telling the phone to run an app
  runApp(MyApp());
}

//Building a material app in a stateless widget.

class MyApp extends StatelessWidget {
  @override
  //Build call. This allows changes you make to the code to show imminently using hot reload
  Widget build(BuildContext context) {
    return MaterialApp(
      //The skeleton of your app
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        //Safe area puts the widgets in places visible by the user.
        body: SafeArea(
          //columns are vertical
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Usually used for user profiles or images
              //Press ctrl+q to see options
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/Capture.test.JPG'),
              ),
              Text(
                'Mattías Enok Þórarinsson',
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'DancingScript',
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                'NTV STUDENT',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'SourceSansPro',
                  color: Colors.white60,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //Phone number
              SizedBox(
                height: 20.0,
                width: 180.0,
                child: Divider(
                  color: Colors.white60,
                ),
              ),

              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                  ),
                  title: Text(
                    'Phone Number:',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    '888-9999',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              //Email
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                  ),
                  title: Text(
                    'E-mail:',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: Text(
                    'met1@nemandi.ntv.is',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
