import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 33, 33, 1),
      body: Center(child: SingleChildScrollView(
        child: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > 768) {
            Widget divider = Container(
              height: 190,
              width: 3,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 1.0,
                )
              ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
            );
            infos.removeAt(2);
            infos.insert(2, divider);
            return Row(
                mainAxisAlignment: MainAxisAlignment.center, children: infos);
          } else {
            Widget divider = Container(
              height: 3,
              width: MediaQuery.of(context).size.width - 70,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 1.0,
                )
              ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
            );
            infos.removeAt(2);
            infos.insert(2, divider);
            return Column(
                mainAxisAlignment: MainAxisAlignment.center, children: infos);
          }
        }),
      )),
    );
  }

  List<Widget> infos = [
    Text(
      'kaipo',
      style: TextStyle(color: Colors.white, fontSize: 100),
    ),
    SizedBox(
      width: 30,
      height: 30,
    ),
    SizedBox(),
    // orientation
    //     ? Divider(
    //         indent: 100,
    //         endIndent: 100,
    //         thickness: 10,
    //         color: Colors.white,
    //       )
    // VerticalDivider(
    //   indent: 100,
    //   endIndent: 100,
    //   thickness: 10,
    //   color: Colors.white,
    // ),
    // Container(
    //   height: teste ? 170 : 10,
    //   width: teste ? 10 : 100,
    //   decoration: BoxDecoration(
    //       color: Colors.white, borderRadius: BorderRadius.circular(8)),
    // ),
    SizedBox(
      width: 30,
      height: 30,
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'DESENVOLVIMENTO',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        Text(
          'WEB | MOBILE',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          'SOLUÇÕES',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        Text(
          'COMERCIAIS',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ],
    )
  ];
}
