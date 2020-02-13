import 'package:flutter/material.dart';

class Sort extends StatefulWidget {
  @override
  _Sort createState() => _Sort();
}

class _Sort extends State<Sort> {
  double _value = 5;
  int _radioValue1 = 1;
  bool _checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The Algorithms"),
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.grey,
              margin: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  RaisedButton(
                    onPressed: (){},
                    child: Text(
                      "Generate random array"
                    ),
                  ),

                  SizedBox(
                    width: 100.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Set speed and array size:",
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),

                  Slider(
                    value: _value,
                    min: 1,
                    max: 10,
                    divisions: 10,
                    activeColor: Colors.blue,
                    inactiveColor: Colors.grey,
                    onChanged: (value) {
                      setState(() {
                        print(value);
                      });
                    },
                  ),
                  
                  SizedBox(
                    width: 100.0,
                  ),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: 1,
                        groupValue: _radioValue1,
                        onChanged: (value) {
                          setState(() {
                            _radioValue1 = value;
                          });
                        },
                      ),
                      new Text(
                        'Bubble sort',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                      Radio(
                        value: 2,
                        groupValue: _radioValue1,
                        onChanged: (value) {
                          setState(() {
                            _radioValue1 = value;
                          });
                        },
                      ),
                      new Text(
                        'Quick sort',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                      Radio(
                        value: 3,
                        groupValue: _radioValue1,
                        onChanged: (value) {
                          setState(() {
                            _radioValue1 = value;
                          });
                        },
                      ),
                      new Text(
                        'Merge sort',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 100.0,
                  ),
                  RaisedButton(
                    onPressed: () {},
                    child: Text("Sort"),
                    color: Colors.blue,
                  )
                ],
              ),
            ),
            CustomPaint(
              painter: DrawBars(),
              child: Container(
                margin: EdgeInsets.all(8.0),
                height: MediaQuery.of(context).copyWith().size.height - 150,
              ),
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text("Sort"),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text("Sort"),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class DrawBars extends CustomPainter {

  int barCount;

  DrawBars({this.barCount});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Draw bottom line
    paint.color = Colors.black;
    var startPoint = Offset(50, size.height - 50);
    var endPoint = Offset(size.width - 50, size.height - 50);
    canvas.drawLine(startPoint, endPoint, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
