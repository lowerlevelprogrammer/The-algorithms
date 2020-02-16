import 'package:flutter/material.dart';
import 'dart:math';

class Sort extends StatefulWidget {
  @override
  _Sort createState() => _Sort();
}

class _Sort extends State<Sort> {
  double _value = 10;
  int _radioValue1 = 1;
  bool _checkBoxValue = false;

  List<int> array;

  @override
  void initState() {
    super.initState();
    array = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
    generateRandomArray();
  }

  void generateRandomArray() {

    var range = Random();
    array = List.generate(10, (_) => range.nextInt(100));
  }
  
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
                        _value = value.toInt().toDouble();
                        print('Slider value: $_value');
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
                    onPressed: () {
                      setState(() {
                        array.add(100);
                      });
                    },
                    child: Text("Sort"),
                    color: Colors.blue,
                  )
                ],
              ),
            ),
            CustomPaint(
              painter: DrawBars(array: array),
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

  List<int> array;

  DrawBars({this.array});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    Offset start, end;

    // Draw bottom line
    paint.color = Colors.black;
    var startPoint = Offset(50, size.height - 50);
    var endPoint = Offset(size.width - 50, size.height - 50);
    canvas.drawLine(startPoint, endPoint, paint);

    // Draw sart and end points
    
    // Get working area
    start = Offset(100, size.height - 50);
    end = Offset(size.width - 100, size.height - 50);

    // Draw circles
    canvas.drawCircle(start, 5, paint);
    canvas.drawCircle(end, 5, paint);

    // Draw bars
    for(int i = 0; i < array.length; i++) {
      if(i % 2 == 0) {
        paint.color = Colors.blue;
      } else {
        paint.color = Colors.black;
      }      
      canvas.drawRect(Rect.fromLTWH(start.dx + (i * 20), start.dy - (array[i]), 20.0, (array[i]).toDouble()), paint);
    }

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
