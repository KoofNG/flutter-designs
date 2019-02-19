import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List categories = [
    {
      'catImage': 'assets/icons/airtravel.png',
      'catName': 'Planes',
      'catCount': 103,
      'selected': false
    },
    {
      'catImage': 'assets/icons/boat.png',
      'catName': 'Boat',
      'catCount': 73,
      'selected': false
    },
    {
      'catImage': 'assets/icons/bus.png',
      'catName': 'Buses',
      'catCount': 457,
      'selected': false
    },
    {
      'catImage': 'assets/icons/fastCar.png',
      'catName': 'Fast Cars',
      'catCount': 342,
      'selected': false
    },
    {
      'catImage': 'assets/icons/run.png',
      'catName': 'Running',
      'catCount': 43,
      'selected': false
    },
    {
      'catImage': 'assets/icons/scooter.png',
      'catName': 'Scooter',
      'catCount': 903,
      'selected': false
    },
    {
      'catImage': 'assets/icons/ship.png',
      'catName': 'Ship',
      'catCount': 14,
      'selected': false
    },
    {
      'catImage': 'assets/icons/yatch.png',
      'catName': 'Yatch',
      'catCount': 7,
      'selected': false
    }
  ];

  double _value = 0.0;
  @override
  Widget build(BuildContext context) {
    double _deviceWidth = MediaQuery.of(context).size.width;
    double _deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 28.0,
              ),
            );
          },
        ),
      ),
      body: Container(
        width: _deviceWidth,
        height: _deviceHeight,
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
        child: Column(
          children: <Widget>[
            Container(
              width: _deviceWidth,
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Which categories do you want to see the most?',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 24.0,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              child: LinearProgressIndicator(
                value: _value,
                backgroundColor: Colors.grey.withOpacity(0.2),
              ),
            ),
            Expanded(
              child: Container(
                width: _deviceWidth,
                child: GridView.builder(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
                  itemCount: categories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    Map eachCategory = categories[index];
                    return Card(
                      child: Container(
                        height: _deviceHeight * 0.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          border: Border.all(
                              color: Colors.pink[500],
                              width: eachCategory['selected'] == true
                                  ? 2.5
                                  : 0.0), // This is called the ternary operation, It's a shorter if-else statement,  look it up.)
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              eachCategory['selected'] = !eachCategory['selected'];
                            });
                            if (eachCategory['selected'] == true){
                              _value += 0.1;
                            } else {
                              _value -= 0.1;
                            }
                          },
                          child: cardDisplay(
                              eachCategory['catImage'],
                              eachCategory['catName'],
                              eachCategory['catCount']),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              child: RaisedButton(
                onPressed: () => null,
                padding: EdgeInsets.all(0.0),
                textTheme: ButtonTextTheme.primary,
                /* onPressed: () => null, */
                child: Container(
                  width: _deviceWidth,
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color.fromRGBO(101, 194, 255, 1)),
                  child: Text(
                    'Create my feed',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardDisplay(String catImage, String catName, int catCount) {
    return Card(
      margin: EdgeInsets.all(0.0),
      elevation: 0.0,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 60.0,
              width: 70.0,
              child: Image.asset(catImage),
            ),
            Container(
              padding: EdgeInsets.all(2.0),
              child: Text(
                catName,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(2.0),
              child: Text(
                catCount.toString() + ' items',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
