import 'package:flatline/chargen_attributes.dart';
import 'package:flatline/chargen_inventory.dart';
import 'package:flutter/material.dart';

class MyChargenLifepathPage extends StatefulWidget {
  MyChargenLifepathPage({super.key, required this.title, required this.characters});

  List characters;
  final String title;

  @override
  State<MyChargenLifepathPage> createState() => _MyChargenLifepathPageState(characters);
}

class _MyChargenLifepathPageState extends State<MyChargenLifepathPage> {
  List characters = [];
  Map character = Map();
  String lifepath = "";

  _MyChargenLifepathPageState(this.characters)
  {
    character = characters[characters.length-1];
  }

  void _prevPage() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyChargenAttrPage(title: widget.title, characters: characters,))
    );
  }

  void _nextPage()
  {
    character["Notes"] = Map();
    character["Notes"]["Lifepath"] = lifepath;
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyChargenInvPage(title: widget.title, characters: characters))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("RUN YOUR LIFEPATH", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: "Write your backstory. Or don't.",),
                scrollPadding: EdgeInsets.all(20.0),
                keyboardType: TextInputType.multiline,
                maxLines: 99999,
                autofocus: true,
                onChanged: (text){
                  lifepath = text;
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: 30),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: _prevPage,
                tooltip: 'Prev',
                child: const Icon(Icons.keyboard_arrow_left),
              ),
              Expanded(child: Container()),
              FloatingActionButton(
                onPressed: _nextPage,
                tooltip: 'Next',
                child: const Icon(Icons.keyboard_arrow_right),
              ),
            ]
        )
      ),
    );
  }
}
