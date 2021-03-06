import 'package:flutter/material.dart';
import 'dart:math';

class Sort extends StatefulWidget {
  @override
  _Sort createState() => _Sort();
}

class _Sort extends State<Sort> {
  double _value = 1;
  int _radioValue1 = 1;
  bool _checkBoxValue = false;

  List<int> array;

  @override
  void initState() {
    super.initState();
    generateRandomArray();
  }

  void generateRandomArray() {

    var range = Random();    
    int barCount = 10 * _value.toInt();

    array = List.generate(barCount, (_) => range.nextInt(200));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The Algorithms"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
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
                        generateRandomArray();
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

  double barWidth;
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

    barWidth = (end.dx - start.dx) / array.length;
    

    // Draw circles
    canvas.drawCircle(start, 5, paint);
    canvas.drawCircle(end, 5, paint);

    // Draw bars
    for(int i = 0; i < array.length; i++) {

      if(i % 2 == 0) {
        paint.color = Colors.blue;
      } else {
        paint.color = Colors.blue.shade200;
      }      
      canvas.drawRect(Rect.fromLTWH(start.dx + (i * barWidth), start.dy - (array[i]), barWidth, (array[i]).toDouble()), paint);
    }

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
