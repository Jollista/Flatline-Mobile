import 'package:flatline/main.dart';
import 'package:flutter/material.dart';

/*
    //Character class for character stats and stuff
    this.name = name;
    role = character["Role Info"]["Role"];
    rank = int.parse(character["Role Info"]["Role"]);
    ip = int.parse(character["Management"]["ip"]);
    ipTotal = int.parse(character["Management"]["ip total"]);

    //stats
    intelligence = int.parse(character["Attributes"]["INT"]);
    reflex = int.parse(character["Attributes"]["REF"]);
    dexterity = int.parse(character["Attributes"]["DEX"]);
    technology = int.parse(character["Attributes"]["TECH"]);
    cool = int.parse(character["Attributes"]["COOL"]);
    will = int.parse(character["Attributes"]["WILL"]);
    movement = int.parse(character["Attributes"]["MOVE"]);
    body = int.parse(character["Attributes"]["BODY"]);
    empathy = int.parse(character["Attributes"]["EMP"]);
    luckMax = int.parse(character["Attributes"]["LUCK"]);
    luck = luckMax;

    //derived stats
    hpMax = int.parse(character["Attributes"]["HP"]); //((body+will)/2).ceil() * 5 + 10
    hp = int.parse(character["Management"]["Hp"]);
    humanity = int.parse(character["Management"]["Hum"]);
    */

class NamedQuantity
{
  String name;
  int rank;
  NamedQuantity(this.name, this.rank);

  String toString()
  {
    return "($name | $rank)";
  }
}

class MyCharacterPage extends StatefulWidget {
  Map character;
  String title;

  MyCharacterPage({super.key, required this.title, required this.character});

  @override
  State<MyCharacterPage> createState() => _MyCharacterPageState(character);
}

class _MyCharacterPageState extends State<MyCharacterPage> {
  Map character = Map();

  _MyCharacterPageState(this.character);

  int _selectedIndex = 0;
  static const TextStyle attrStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const TextStyle whiteOptionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);

  //display specific information about character depending on _selectedIndex
  Widget displayWidget(int index) {
    //lists used for card lists (skills, gear)
    List skills = [];
    List gear = [];
    List notes = [];

    //attributes
    if (index == 0) {
      return Center(
        child:
        GridView.count(
          crossAxisCount: 4,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Column(
              children: [
                Text(character["Name"].toString().toUpperCase(), style: optionStyle, textAlign: TextAlign.center,),
                Text("${character["Role Info"]["Role"]}", style: attrStyle, textAlign: TextAlign.center,)
              ],
            ),
            Image.asset("assets/images/${character["Role Info"]["Role"]}-1.jpg"),
            Image.asset("assets/images/${character["Role Info"]["Role"]}-2.jpg"),
            Column(
              children: [
                Text(character["Role Info"]["Role"].toString().toUpperCase(), style: optionStyle, textAlign: TextAlign.center,),
                Text("Rank ${character["Role Info"]["Rank"]}", style: attrStyle, textAlign: TextAlign.center,),
              ],
            ),

            Column(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.red[900],border: Border.all(width: 2, color: Colors.red.shade900),borderRadius: BorderRadius.circular(12),),
                  child: Text("${character["Management"]["Hp"]} / ${character["Attributes"]["HP"]}", style: whiteOptionStyle, textAlign: TextAlign.center,),
                ),
                Text("HP", style: attrStyle, textAlign: TextAlign.center,),
              ],
            ),
            Image.asset("assets/images/${character["Role Info"]["Role"]}-3.jpg"),
            Image.asset("assets/images/${character["Role Info"]["Role"]}-4.jpg"),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.red[900],border: Border.all(width: 2, color: Colors.red.shade900),borderRadius: BorderRadius.circular(12),),
                  child: Text("${character["Management"]["ip"]} / ${character["Management"]["ip total"]}", style: whiteOptionStyle, textAlign: TextAlign.center,),
                ),
                Text("IP", style: attrStyle, textAlign: TextAlign.center,),
              ],
            ),

            Column(
              children: [
                Text("INT", style: attrStyle, textAlign: TextAlign.center,),
                Container(
                  decoration: BoxDecoration(color: Colors.red[900],border: Border.all(width: 10, color: Colors.red.shade900),borderRadius: BorderRadius.circular(12),),
                  child: Text("${character["Attributes"]["INT"]}", style: whiteOptionStyle, textAlign: TextAlign.center,),
                ),
              ],
            ),
            Column(
              children: [
                Text("REF", style: attrStyle, textAlign: TextAlign.center,),
                Container(
                  decoration: BoxDecoration(color: Colors.red[900],border: Border.all(width: 10, color: Colors.red.shade900),borderRadius: BorderRadius.circular(12),),
                  child: Text("${character["Attributes"]["REF"]}", style: whiteOptionStyle, textAlign: TextAlign.center,),
                ),
              ],
            ),
            Column(
              children: [
                Text("DEX", style: attrStyle, textAlign: TextAlign.center,),
                Container(
                  decoration: BoxDecoration(color: Colors.red[900],border: Border.all(width: 10, color: Colors.red.shade900),borderRadius: BorderRadius.circular(12),),
                  child: Text("${character["Attributes"]["DEX"]}", style: whiteOptionStyle, textAlign: TextAlign.center,),
                ),
              ],
            ),
            Column(
              children: [
                Text("TECH", style: attrStyle, textAlign: TextAlign.center,),
                Container(
                  decoration: BoxDecoration(color: Colors.red[900],border: Border.all(width: 10, color: Colors.red.shade900),borderRadius: BorderRadius.circular(12),),
                  child: Text("${character["Attributes"]["TECH"]}", style: whiteOptionStyle, textAlign: TextAlign.center,),
                ),
              ],
            ),

            Column(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.red[900],border: Border.all(width: 10, color: Colors.red.shade900),borderRadius: BorderRadius.circular(12),),
                  child: Text("${character["Attributes"]["COOL"]}", style: whiteOptionStyle, textAlign: TextAlign.center,),
                ),
                Text("COOL", style: attrStyle, textAlign: TextAlign.center,),
              ],
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.red[900],border: Border.all(width: 10, color: Colors.red.shade900),borderRadius: BorderRadius.circular(12),),
                  child: Text("${character["Attributes"]["WILL"]}", style: whiteOptionStyle, textAlign: TextAlign.center,),
                ),
                Text("WILL", style: attrStyle, textAlign: TextAlign.center,),
              ],
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.red[900],border: Border.all(width: 10, color: Colors.red.shade900),borderRadius: BorderRadius.circular(12),),
                  child: Text("${character["Attributes"]["MOVE"]}", style: whiteOptionStyle, textAlign: TextAlign.center,),
                ),
                Text("MOVE", style: attrStyle, textAlign: TextAlign.center,),
              ],
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.red[900],border: Border.all(width: 10, color: Colors.red.shade900),borderRadius: BorderRadius.circular(12),),
                  child: Text("${character["Attributes"]["BODY"]}", style: whiteOptionStyle, textAlign: TextAlign.center,),
                ),
                Text("BODY", style: attrStyle, textAlign: TextAlign.center,),
              ],
            ),

            Column(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.red[900],border: Border.all(width: 2, color: Colors.red.shade900),borderRadius: BorderRadius.circular(12),),
                  child: Text("${character["Management"]["Hum"]} / ${character["Attributes"]["EMP"]}", style: whiteOptionStyle, textAlign: TextAlign.center,),
                ),
                Text("EMP", style: attrStyle, textAlign: TextAlign.center,),
              ],
            ),
            Text(""),
            Text(""),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.red[900],border: Border.all(width: 2, color: Colors.red.shade900),borderRadius: BorderRadius.circular(12),),
                  child: Text("${character["Management"]["Luck"]} / ${character["Attributes"]["LUCK"]}", style: whiteOptionStyle, textAlign: TextAlign.center,),
                ),
                Text("LUCK", style: attrStyle, textAlign: TextAlign.center,),
              ],
            ),
          ],
        )
      );
    }

    //skills
    else if (index == 1) {
      if (skills.isEmpty) {character["Skills"].forEach((k, v) => skills.add(NamedQuantity(k, v)));}
      print("..Skills list is : ${skills}");
      return ListView.builder(
          itemCount: skills.length,
          itemBuilder: (context, index) {
            return Card(
                key: ValueKey(skills[index]),
                margin: const EdgeInsets.all(10),
                color: Colors.red,
                child: ListTile(
                  title: Text(skills[index].name, style:const TextStyle(color: Colors.white)),
                  subtitle: Text("${skills[index].rank}", style:const TextStyle(color: Colors.white)),
                )
            );
          }
      );
    }

    //inv
    else if (index == 2) {
      if (gear.isEmpty) {character["Gear"].forEach((k, v) => gear.add(NamedQuantity(k, v)));}
      print("..Gear list is : ${gear}");
      return ListView.builder(
          itemCount: gear.length,
          itemBuilder: (context, index) {
            return Card(
                key: ValueKey(gear[index]),
                margin: const EdgeInsets.all(10),
                color: Colors.red,
                child: ListTile(
                  title: Text(gear[index].name, style:const TextStyle(color: Colors.white)),
                  subtitle: Text("${gear[index].rank}", style:const TextStyle(color: Colors.white)),
                )
            );
          }
      );
    }

    //notes
    else if (index == 3) {
      if (notes.isEmpty) {character["Notes"].values.forEach((v) => notes.add(v));}
      print("..Gear list is : ${notes}");
      return ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return Card(
                key: ValueKey(notes[index]),
                margin: const EdgeInsets.all(10),
                color: Colors.red,
                child: ListTile(
                  title: Text("${notes[index]}", style:const TextStyle(color: Colors.white)),
                )
            );
          }
      );
    }

    //base case, shouldn't ever display
    return const Text("i dunno what to display", style: optionStyle);
  }

  void _goHome() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MyHomePage(title: 'FLATLINE')));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            _goHome();
          },
          child: Icon(Icons.home),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'STAT',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'SKILL',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.backpack),
            label: 'INV',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notes),
            label: 'NOTES',
            backgroundColor: Colors.red,
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.red[900],
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
      body: Container(
        child: displayWidget(_selectedIndex),
      ),
    );
  }
}
