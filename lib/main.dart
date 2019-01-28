import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp()
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _painter extends CustomPainter {
  
  @override
  void paint(Canvas canvas, Size size) {
    // all our work will be done
    final radius = 100.0;
    final Offset offset = new Offset(0.0, 75.0);
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 10.0
      ..color = Colors.blue[500]
      ..style = PaintingStyle.stroke;

    final Offset bodyStart = new Offset(0.0, 50.0);
    final Offset bodyEnd = new Offset(0.0, 0.0);

    canvas.drawCircle(offset, radius, paint);
    canvas.drawLine(bodyStart, bodyEnd, paint);
    
    final Rect rect = new Rect.fromCircle(
      center: offset, radius: radius
    );
    final Paint rectPaint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 10.0
      ..color = Colors.orange
      ..style = PaintingStyle.stroke;

      canvas.drawRect(rect, rectPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}

class _State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name here'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text('Hello', style: new TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold
              ),),
              new CustomPaint(painter: new _painter(),)
            ],
          ),
        ),
      ),
    );
  }
}