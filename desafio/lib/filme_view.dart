import 'package:flutter/material.dart';

class FilmeView extends StatefulWidget {
  @override
  _FilmeViewState createState() => _FilmeViewState();
}

class _FilmeViewState extends State<FilmeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          child: Text(
            '    Lançamentos    ',
            style: TextStyle(fontSize: 16),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.red,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(children: [
          ComponentContainer(),
          ComponentContainer(),
          // ComponentContainer(),
          // ComponentContainer(),
          // ComponentContainer(),
          // ComponentContainer(),
          // ComponentContainer(),
          // ComponentContainer(),
          // ComponentContainer(),
          // ComponentContainer(),
          // ComponentContainer(),
          // ComponentContainer(),
          // ComponentContainer(),
          // ComponentContainer(),
          // ComponentContainer(),
          // ComponentContainer(),
          // ComponentContainer(),
          // ComponentContainer(),
          // ComponentContainer(),
          // ComponentContainer(),
        ]),
      ),
    );
  }
}

class ComponentContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 100,
      height: 300,
      margin: EdgeInsets.fromLTRB(100, 50, 100, 50),
    );
  }
}
