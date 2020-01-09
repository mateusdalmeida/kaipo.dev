import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offset;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _offset = Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero)
        .animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 33, 33, 1),
      bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height / 9,
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 768) {
                return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: footer);
              } else {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: footer);
              }
            },
          )),
      body: Center(child: SingleChildScrollView(
        child: LayoutBuilder(builder: (context, constraints) {
          Widget kaipo = SlideTransition(
            position: _offset,
            child: SelectableText(
              'kaipo',
              style: TextStyle(color: Colors.white, fontSize: 100),
            ),
          );

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
            infos.removeAt(0);
            infos.insert(0, kaipo);
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
            infos.removeAt(0);
            infos.insert(0, kaipo);
            infos.removeAt(2);
            infos.insert(2, divider);
            return Column(
                mainAxisAlignment: MainAxisAlignment.center, children: infos);
          }
        }),
      )),
    );
  }

  List<Widget> footer = [
    Text(
      "copyright \u00a9 2020 kaipo - Todos os direitos reservados",
      style: TextStyle(color: Colors.white),
    ),
    SelectableText(
      "contato@kaipo.dev",
      style: TextStyle(color: Colors.white),
    ),
  ];

  List<Widget> infos = [
    SizedBox(),
    SizedBox(
      width: 30,
      height: 30,
    ),
    SizedBox(),
    SizedBox(
      width: 30,
      height: 30,
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SelectableText(
          'DESENVOLVIMENTO',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        SelectableText(
          'WEB | MOBILE',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        SizedBox(
          height: 30,
        ),
        SelectableText(
          'SOLUÇÕES',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        SelectableText(
          'COMERCIAIS',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ],
    )
  ];
}
