import 'dart:convert';
import 'dart:io';
import 'package:flatline/chargen_lifepath.dart';
import 'package:flatline/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class MyChargenInvPage extends StatefulWidget {
  MyChargenInvPage({super.key, required this.title, required this.characters});

  List characters;
  final String title;

  @override
  State<MyChargenInvPage> createState() => _MyChargenInvPageState(characters); //get characters from prev page
}

class _MyChargenInvPageState extends State<MyChargenInvPage> {
  //character information
  List characters = [];
  Map character = Map();

  //map for purchased gear
  Map gear = Map();
  //max funds to purchase equipment
  int funds = 2550;

  //preset styles for UI
  static const TextStyle headerStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const TextStyle itemLabelStyle =
      TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
  static const TextStyle quantityLabelStyle =
      TextStyle(fontSize: 25, fontStyle: FontStyle.italic);

  _MyChargenInvPageState(this.characters)
  {
    //active character being built was added to end of characters list
    character = characters[characters.length-1];
  }

  //return to previous page
  void _prevPage() {
    //Do not save, go to previous page without saving purchased gear
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyChargenLifepathPage(
                  title: widget.title,
                  characters: characters,
                )));
  }

  //Go to next page
  void _nextPage() {
    //save purchased gear to character
    character["Gear"]=gear;
    //save changes to character to json
    saveJSON();
    //go home
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyHomePage(title: "CHARACTER CREATED")));
  }

  //save character to Characters.json
  Future<void> saveJSON() async {
    //create an initialize a json map and set its value to characters, passed through screens
    Map jsonMap = Map();
    jsonMap["Characters"] = characters;

    //get local documents directory with path_provider to persist after app closes
    final Directory directory = await getApplicationDocumentsDirectory();
    //access Characters.json save file
    final File file = File('${directory.path}/Characters.json');
    //encode json map as string
    final String toSave = jsonEncode(jsonMap);
    //save to file
    file.writeAsString(toSave);
    print("..Contents of Characters.json:\n$toSave");
  }

  //Buy an item
  void buy({String item = "Bullets", int cost = 10}) {
    //if too expensive, return
    if (funds < cost){return;}

    //initialize if null
    if (!gear.containsKey(item)){gear[item]=0;}

    //update counters
    setState(() {
      gear[item]+=1;
      funds-=cost;
    });
  }

  //Sell an item
  void sell({String item="Bullets", int cost=10}) {
    //if has none, return
    if (!gear.containsKey(item)){return;}

    //update counters
    setState(() {
      gear[item]-=1;
      funds+=cost;
    });

    //remove items of zero quantity, only track items of quantity >= 1
    if (gear[item] == 0){gear.remove(item);}
  }

  //UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("BUY STUFF", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(17),
          children: <Widget>[
            Text("Funds: ${funds} eb", style: headerStyle,),
            Text("Medium Pistol", style: itemLabelStyle),
            Text("50 eb x ${gear["Medium Pistol"]}", style:quantityLabelStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () => {buy(item: "Medium Pistol", cost: 50)}, child: Text("+")),
                ElevatedButton(
                    onPressed: () => {sell(item: "Medium Pistol", cost: 50)}, child: Text("-"))
              ],
            ),

            Text("Heavy Pistol", style: itemLabelStyle),
            Text("100 eb x ${gear["Heavy Pistol"]}", style:quantityLabelStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () => {buy(item: "Heavy Pistol", cost: 100)}, child: Text("+")),
                ElevatedButton(
                    onPressed: () => {sell(item: "Heavy Pistol", cost: 100)}, child: Text("-"))
              ],
            ),

            Text("Very Heavy Pistol", style: itemLabelStyle),
            Text("100 eb x ${gear["Very Heavy Pistol"]}", style:quantityLabelStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () => {buy(item: "Very Heavy Pistol", cost: 100)}, child: Text("+")),
                ElevatedButton(
                    onPressed: () => {sell(item: "Very Heavy Pistol", cost: 100)}, child: Text("-"))
              ],
            ),

            Text("Bullets (10)", style: itemLabelStyle),
            Text("10 eb x ${gear["Bullets"]}", style:quantityLabelStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () => {buy(item: "Bullets", cost: 10)}, child: Text("+")),
                ElevatedButton(
                    onPressed: () => {sell(item: "Bullets", cost: 10)}, child: Text("-"))
              ],
            ),

            Text("Leathers", style: itemLabelStyle),
            Text("20 eb x ${gear["Leathers"]}", style:quantityLabelStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () => {buy(item: "Leathers", cost: 20)}, child: Text("+")),
                ElevatedButton(
                    onPressed: () => {sell(item: "Leathers", cost: 20)}, child: Text("-"))
              ],
            ),

            Text("Kevlar", style: itemLabelStyle),
            Text("50 eb x ${gear["Kevlar"]}", style:quantityLabelStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () => {buy(item: "Kevlar", cost: 50)}, child: Text("+")),
                ElevatedButton(
                    onPressed: () => {sell(item: "Kevlar", cost: 50)}, child: Text("-"))
              ],
            ),

            Text("Light Armorjack", style: itemLabelStyle),
            Text("100 eb x ${gear["Light Armorjack"]}", style:quantityLabelStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () => {buy(item: "Light Armorjack", cost: 100)}, child: Text("+")),
                ElevatedButton(
                    onPressed: () => {sell(item: "Light Armorjack", cost: 100)}, child: Text("-"))
              ],
            ),

            //etc...
          ],
        ),
      ),
      floatingActionButton: Padding(
          padding: EdgeInsets.only(left: 30),
          child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            FloatingActionButton(
              onPressed: _prevPage,
              tooltip: 'Prev',
              child: const Icon(Icons.keyboard_arrow_left),
            ),
            Expanded(child: Container()),
            FloatingActionButton(
              onPressed: _nextPage,
              tooltip: 'Finish',
              child: const Icon(Icons.download_done),
            ),
          ])),
    );
  }
}
