import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xf02a2a2a),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;
//
// void _incrementCounter() {
//  setState(() {

//      _counter++;
//    });
//  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(

      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 48, 0, 32),
        child: Column(children: const [
          TrackingElement(color: Color(0xff6dff41), iconData: Icons.directions_run, unit: 'm', max: 5000,),
          TrackingElement(color: Color(0xff8946fd), iconData: Icons.local_drink, unit : 'l', max: 3000,),
          TrackingElement(color: Color(0xfffa3d53), iconData: Icons.fastfood, unit : 'kcal', max: 1800,),
        ],),
      ),
    );
  }
}
class TrackingElement extends StatefulWidget {
  const TrackingElement({Key? key,
    required this.color,
    required this.iconData,
    required this.unit ,
    required this.max,

  })
      : super(key: key);

  final Color color;
  final IconData iconData;
  final String unit;
  final double max;


  @override
  State<TrackingElement> createState() => _TrackingElementState();
}

class _TrackingElementState extends State<TrackingElement> {

  int _counter = 0;
  double _progress = 0;

  void _incrementCounter() {
  setState(() {

      _counter+= 200;
      _progress = _counter / widget.max;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: _incrementCounter,
      child: Column(
      children:  <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 64, 32, 32),
          child: Row(children:  <Widget>[
            Icon (widget.iconData, color: Colors.white60,size: 60),
            Text(
                '$_counter / ${widget.max.toInt()} ${widget.unit}',
                style:  const TextStyle(color: Colors.white60, fontSize: 32)
            ),
          ],
          ),
        ),
        LinearProgressIndicator(
          value: _progress,
          color: widget.color,
          backgroundColor: const Color(0x40fcfbfb),
          minHeight: 10.0,
        )
      ],
    ),
    );
  }
}

