import 'package:flutter/material.dart';

void main() {
  print('Hello world');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Louies First App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = "";

  void changeText(String text) {
    this.setState(() {
      this.text = text;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Hello World")),
        body: Column(children: <Widget>[
          TextInputWidget(this.changeText),
          Text(this.text)
        ]));
  }
}

// keyboard shortcut 'stful' for a stateful widget
class TextInputWidget extends StatefulWidget {
  final Function(String) callback;

  TextInputWidget(this.callback);

  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  // this controller obj gives us access to the text inputs contents!
  final controller = TextEditingController();

  // since we start a controller up there we need to modify the parent classes dispose function
  // to dispose of it as well
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void handleSendButtonPressed() {
    widget.callback(controller.text);
    // after submission clear the controller
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: this.controller,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.message),
            labelText: "Type a message:  ",
            suffixIcon: IconButton(
                icon: Icon(Icons.send),
                splashColor: Colors.green,
                tooltip: 'Post message',
                onPressed: this.handleSendButtonPressed)));
  }
}
