import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:miscelleanous/src/Categories.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _deviceWidth = MediaQuery.of(context).size.width;
    double _deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: _deviceWidth,
        height: _deviceHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.softLight),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 2.5),
              child: Text(
                'WELCOME',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 7.5),
              child: Text(
                'Long time \nno see.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 42.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 40.0),
              padding: EdgeInsets.only(left: 25.0),
              width: _deviceWidth,
              height: 60.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                      width: _deviceWidth * 0.75,
                      margin: EdgeInsets.only(right: 2.0),
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0)),
                      ),
                      child: accountChoice('assets/images/avatarOne.jpg',
                          'George Bush', _deviceWidth)),
                  Container(
                    width: _deviceWidth * 0.75,
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                    ),
                    child: accountChoice('assets/images/avatarTwo.jpg',
                        'John Doe', _deviceWidth),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 2.5),
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 25.0),
              child: InkWell(
                onTap: () {
                  print('hello');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Categories()));
                },
                child: raiseButton('Create Account',
                    Color.fromRGBO(101, 194, 255, 1), _deviceWidth),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 3.0, 0.0, 10.0),
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 25.0),
              child: raiseButton('Sign up with Facebook',
                  Color.fromRGBO(18, 34, 85, 1), _deviceWidth),
            ),
          ],
        ),
      ),
    );
  }

  Widget raiseButton(String content, Color bgColor, double width) {
    return RaisedButton(
      padding: EdgeInsets.all(0.0),
      textTheme: ButtonTextTheme.primary,
      /* onPressed: () => null, */
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: bgColor),
        child: Text(
          content,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget accountChoice(String imageUrl, String userName, double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 25.0,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(imageUrl),
        ),
        Container(
          width: width * 0.50,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(
                  'Continue as',
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 16.0,
                  ),
                ),
              ),
              Container(
                child: Text(
                  userName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 30.0,
          child: FlatButton(
            padding: EdgeInsets.all(0.0),
            onPressed: () => null,
            child: Icon(Icons.keyboard_arrow_right, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
