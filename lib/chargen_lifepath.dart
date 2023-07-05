import 'package:flatline/chargen_attributes.dart';
import 'package:flatline/chargen_inventory.dart';
import 'package:flutter/material.dart';

class MyChargenLifepathPage extends StatefulWidget {
  MyChargenLifepathPage({super.key, required this.title, required this.characters});

  List characters;
  final String title;

  @override
  State<MyChargenLifepathPage> createState() => _MyChargenLifepathPageState(characters); //get characters from prev page
}

class _MyChargenLifepathPageState extends State<MyChargenLifepathPage> {
  //character stuff
  List characters = [];
  Map character = Map();

  //string for backstory
  String lifepath = "";

  _MyChargenLifepathPageState(this.characters)
  {
    //active character being built was added to end of characters list
    character = characters[characters.length-1];
  }

  //return to previous page without saving
  void _prevPage() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyChargenAttrPage(title: widget.title, characters: characters,))
    );
  }

  //save and go to next page
  void _nextPage()
  {
    //save lifepath
    character["Notes"] = Map();
    character["Notes"]["Lifepath"] = lifepath;
    //next page
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyChargenInvPage(title: widget.title, characters: characters))
    );
  }

  //UI, text field for players to write backstory
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
