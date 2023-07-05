import 'package:flatline/chargen_lifepath.dart';
import 'package:flatline/main.dart';
import 'package:flutter/material.dart';

const int INT = 0;
const int REF = 1;
const int DEX = 2;
const int TECH = 3;
const int COOL = 4;
const int WILL = 5;
const int LUCK = 6;
const int MOVE = 7;
const int BODY = 8;
const int EMP = 9;
/*
  class MyCharacterPage extends StatefulWidget {
  List characters;
  String title;

  MyCharacterPage({super.key, required this.title, required this.characters});

  @override
  State<MyCharacterPage> createState() => _MyCharacterPageState(characters);
}

class _MyCharacterPageState extends State<MyCharacterPage> {
  List characters = [];
  int _disCharIndex = -1;

  _MyCharacterPageState(this.characters);
* */

class MyChargenAttrPage extends StatefulWidget {
  MyChargenAttrPage({super.key, required this.title, required this.characters});

  List characters;
  final String title;

  @override
  State<MyChargenAttrPage> createState() => _MyChargenAttrPageState(characters);
}

class _MyChargenAttrPageState extends State<MyChargenAttrPage> {
  List characters = [];
  String name = "";
  String? _selectedRole = "";

  int intelligence = 6;
  int ref = 6;
  int dex = 6;
  int tech = 6;
  int cool = 6;
  int will = 6;
  int luck = 6;
  int move = 6;
  int body = 6;
  int emp = 6;

  int maxStatPoints = 62;
  int currentStatPoints = 2;

  Map skills = {
    "Athletics":2,
    "Brawling":2,
    "Concentration":2,
    "Conversation":2,
    "Education":2,
    "Evasion":2,
    "First Aid":2,
    "Human Perception":2,
    "Language (Streetslang)":2,
    "Local Expert (Your Home)":2,
    "Perception":2,
    "Persuasion":2,
    "Stealth":2,

    "Riding":0,
    "Acting":0,
    "Archery":0,
    "Autofire":0,
    "Handgun":0,
  };

  int maxSkillPoints = 86;
  int currentSkillPoints = 60;

  static const TextStyle attrLabelStyle =
      TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
  static const TextStyle skillLabelStyle =
      TextStyle(fontSize: 20, fontStyle: FontStyle.italic);

  _MyChargenAttrPageState(this.characters);

  void _cancel() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MyHomePage(title: 'FLATLINE')));
  }

  void _nextPage() {
    Map character = Map();
    print("..Name is $name");
    character["Name"] = name;
    character["Role Info"] = {"Role": _selectedRole, "Rank": 4};
    character["Attributes"] = {
      "INT": intelligence,
      "REF": ref,
      "DEX": dex,
      "TECH": tech,
      "COOL": cool,
      "WILL": will,
      "MOVE": move,
      "BODY": body,
      "EMP": emp,
      "LUCK": luck,
      "HP": ((body + will) / 2).ceil() * 5 + 10
    };
    character["Management"]= {
      "ip":0,
      "ip total":0,
      "Hp":character["Attributes"]["HP"],
      "Hum":emp,
      "Luck":luck
    };
    character["Skills"] = skills;
    characters.add(character);

    //go to next page
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyChargenLifepathPage(
                  title: name,
                  characters: characters,
                )));
  }

  //increment attribute given code
  void increment(int attribute) {
    if (currentStatPoints == 0) return;

    switch (attribute) {
      case INT:
        {
          if (intelligence == 8) {
            return;
          }
          setState(() {
            intelligence++;
            currentStatPoints--;
          });
        }
        break;
      case REF:
        {
          if (ref == 8) {
            return;
          }
          setState(() {
            ref++;
            currentStatPoints--;
          });
        }
        break;
      case DEX:
        {
          if (dex == 8) {
            return;
          }
          setState(() {
            dex++;
            currentStatPoints--;
          });
        }
        break;
      case TECH:
        {
          if (tech == 8) {
            return;
          }
          setState(() {
            tech++;
            currentStatPoints--;
          });
        }
        break;
      case COOL:
        {
          if (cool == 8) {
            return;
          }
          setState(() {
            cool++;
            currentStatPoints--;
          });
        }
        break;
      case WILL:
        {
          if (will == 8) {
            return;
          }
          setState(() {
            will++;
            currentStatPoints--;
          });
        }
        break;
      case LUCK:
        {
          if (luck == 8) {
            return;
          }
          setState(() {
            luck++;
            currentStatPoints--;
          });
        }
        break;
      case MOVE:
        {
          if (move == 8) {
            return;
          }
          setState(() {
            move++;
            currentStatPoints--;
          });
        }
        break;
      case BODY:
        {
          if (body == 8) {
            return;
          }
          setState(() {
            body++;
            currentStatPoints--;
          });
        }
        break;
      case EMP:
        {
          if (emp == 8) {
            return;
          }
          setState(() {
            emp++;
            currentStatPoints--;
          });
        }
        break;
    }
  }

  //decrement attribute given code
  void decrement(int attribute) {
    switch (attribute) {
      case INT:
        {
          if (intelligence == 2) {
            return;
          }
          setState(() {
            intelligence--;
            currentStatPoints++;
          });
        }
        break;
      case REF:
        {
          if (ref == 2) {
            return;
          }
          setState(() {
            ref--;
            currentStatPoints++;
          });
        }
        break;
      case DEX:
        {
          if (dex == 2) {
            return;
          }
          setState(() {
            dex--;
            currentStatPoints++;
          });
        }
        break;
      case TECH:
        {
          if (tech == 2) {
            return;
          }
          setState(() {
            tech--;
            currentStatPoints++;
          });
        }
        break;
      case COOL:
        {
          if (cool == 2) {
            return;
          }
          setState(() {
            cool--;
            currentStatPoints++;
          });
        }
        break;
      case WILL:
        {
          if (will == 2) {
            return;
          }
          setState(() {
            will--;
            currentStatPoints++;
          });
        }
        break;
      case LUCK:
        {
          if (luck == 2) {
            return;
          }
          setState(() {
            luck--;
            currentStatPoints++;
          });
        }
        break;
      case MOVE:
        {
          if (move == 2) {
            return;
          }
          setState(() {
            move--;
            currentStatPoints++;
          });
        }
        break;
      case BODY:
        {
          if (body == 2) {
            return;
          }
          setState(() {
            body--;
            currentStatPoints++;
          });
        }
        break;
      case EMP:
        {
          if (emp == 2) {
            return;
          }
          setState(() {
            emp--;
            currentStatPoints++;
          });
        }
        break;
    }
  }

  void incrementSkill({String skill = "Concentration", bool difficult = false})
  {
    //initialize skill if doesn't exist already
    if (!skills.containsKey(skill))
    {skills[skill] = 0;}

    //check base case
    if (currentSkillPoints == 0 || skills[skill] >= 6)
    {return;}

    //increment skill
    setState(() {
      skills[skill] += 1;
      currentSkillPoints--;
      if (difficult)
      {
        currentSkillPoints--;
      }
    });
  }

  void decrementSkill({String skill="Concentration", bool required=false, bool difficult=false})
  {
    //initialize skill if doesn't exist already
    if (!skills.containsKey(skill))
    {skills[skill] = 0;}

    //check base case
    if (skills[skill] == 0 || (skills[skill] == 2 && required) )
    {return;}

    //increment skill
    setState(() {
      skills[skill] -= 1;
      currentSkillPoints++;

      if (difficult)
      {
        currentSkillPoints++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("ASSIGN ATTRIBUTES", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(17),
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              SizedBox(
                width: 200,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                  onChanged: (text)
                  {
                    name = text;
                  }
                ),
              ),
              DropdownMenu<String>(label: Text("Role"), dropdownMenuEntries: const [
                DropdownMenuEntry(value: "Rockerboy", label: "Rockerboy"),
                DropdownMenuEntry(value: "Solo", label: "Solo"),
                DropdownMenuEntry(value: "Netrunner", label: "Netrunner"),
                DropdownMenuEntry(value: "Tech", label: "Tech"),
                DropdownMenuEntry(value: "Medtech", label: "Medtech"),
                DropdownMenuEntry(value: "Media", label: "Media"),
                DropdownMenuEntry(value: "Exec", label: "Exec"),
                DropdownMenuEntry(value: "Lawman", label: "Lawman"),
                DropdownMenuEntry(value: "Fixer", label: "Fixer"),
                DropdownMenuEntry(value: "Nomad", label: "Nomad"),
              ],
              onSelected: (String? role) {
                setState(() {
                  _selectedRole = role;
                  print("..Role is $role\n.._selectedRole is $_selectedRole");
                });
              })
            ]),
            Text(
                "STATS\t$currentStatPoints/$maxStatPoints                                   ",
                style: attrLabelStyle
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("INT | $intelligence", style: attrLabelStyle),
                ElevatedButton(
                    onPressed: () => {increment(INT)}, child: Text("+")),
                ElevatedButton(
                    onPressed: () => {decrement(INT)}, child: Text("-"))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("REF | $ref", style: attrLabelStyle),
                ElevatedButton(
                    onPressed: () => {increment(REF)}, child: Text("+")),
                ElevatedButton(
                    onPressed: () => {decrement(REF)}, child: Text("-"))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("DEX | $dex", style: attrLabelStyle),
                ElevatedButton(
                    onPressed: () => {increment(DEX)}, child: Text("+")),
                ElevatedButton(
                    onPressed: () => {decrement(DEX)}, child: Text("-"))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("TECH | $tech", style: attrLabelStyle),
                ElevatedButton(
                    onPressed: () => {increment(TECH)}, child: Text("+")),
                ElevatedButton(
                    onPressed: () => {decrement(TECH)}, child: Text("-"))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("COOL | $cool", style: attrLabelStyle),
                ElevatedButton(
                    onPressed: () => {increment(COOL)}, child: Text("+")),
                ElevatedButton(
                    onPressed: () => {decrement(COOL)}, child: Text("-"))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("WILL | $will", style: attrLabelStyle),
                ElevatedButton(
                    onPressed: () => {increment(WILL)}, child: Text("+")),
                ElevatedButton(
                    onPressed: () => {decrement(WILL)}, child: Text("-"))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("LUCK | ${luck}", style: attrLabelStyle),
                ElevatedButton(
                    onPressed: () => {increment(LUCK)}, child: Text("+")),
                ElevatedButton(
                    onPressed: () => {decrement(LUCK)}, child: Text("-"))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("MOVE | ${move}", style: attrLabelStyle),
                ElevatedButton(
                    onPressed: () => {increment(MOVE)}, child: Text("+")),
                ElevatedButton(
                    onPressed: () => {decrement(MOVE)}, child: Text("-"))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("BODY | ${body}", style: attrLabelStyle),
                ElevatedButton(
                    onPressed: () => {increment(BODY)}, child: Text("+")),
                ElevatedButton(
                    onPressed: () => {decrement(BODY)}, child: Text("-"))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("EMP | ${emp}", style: attrLabelStyle),
                ElevatedButton(
                    onPressed: () => {increment(EMP)}, child: Text("+")),
                ElevatedButton(
                    onPressed: () => {decrement(EMP)}, child: Text("-"))
              ],
            ),


            Text(
                "SKILLS\t${currentSkillPoints}/${maxSkillPoints}                                   ",
                style: attrLabelStyle
            ),
            const Text(
                "Awareness Skills                                   ",
                style: attrLabelStyle
            ),

            Text("Concentration (WILL) | ${skills["Concentration"]}", style: skillLabelStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () => {incrementSkill(skill: "Concentration")}, child: Text("+")),
                ElevatedButton(
                    onPressed: () => {decrementSkill(skill: "Concentration", required: true)}, child: Text("-"))
              ],
            ),

            const Text(
                "Body Skills                                   ",
                style: attrLabelStyle
            ),

            Text("Athletics (DEX) | ${skills["Athletics"]}", style: skillLabelStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () => {incrementSkill(skill: "Athletics")}, child: Text("+")),
                ElevatedButton(
                    onPressed: () => {decrementSkill(skill: "Athletics", required: true)}, child: Text("-"))
              ],
            ),

            Text("Stealth (DEX) | ${skills["Stealth"]}", style: skillLabelStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () => {incrementSkill(skill: "Stealth")}, child: Text("+")),
                ElevatedButton(
                    onPressed: () => {decrementSkill(skill: "Stealth", required: true)}, child: Text("-"))
              ],
            ),

            const Text(
                "Control Skills                                   ",
                style: attrLabelStyle
            ),

            Text("Riding (REF) | ${skills["Riding"]}", style: skillLabelStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () => {incrementSkill(skill: "Riding")}, child: Text("+")),
                ElevatedButton(
                    onPressed: () => {decrementSkill(skill: "Riding")}, child: Text("-"))
              ],
            ),

            const Text(
                "Education Skills                                   ",
                style: attrLabelStyle
            ),

            Text("Education (INT) | ${skills["Education"]}", style: skillLabelStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () => {incrementSkill(skill: "Education")}, child: Text("+")),
                ElevatedButton(
                    onPressed: () => {decrementSkill(skill: "Education", required: true)}, child: Text("-"))
              ],
            ),

            Text("Language (Streetslang) (INT) | ${skills["Language (Streetslang)"]}", style: skillLabelStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () => {incrementSkill(skill: "Language (Streetslang)")}, child: Text("+")),
                ElevatedButton(
                    onPressed: () => {decrementSkill(skill: "Language (Streetslang)", required: true)}, child: Text("-"))
              ],
            ),

            Text("Local Expert (Your Home) (INT) | ${skills["Local Expert (Your Home)"]}", style: skillLabelStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () => {incrementSkill(skill: "Local Expert (Your Home)")}, child: Text("+")),
                ElevatedButton(
                    onPressed: () => {decrementSkill(skill: "Local Expert (Your Home)", required: true)}, child: Text("-"))
              ],
            ),

            const Text(
                "Fighting Skills                                   ",
                style: attrLabelStyle
            ),

            Text("Brawling (DEX) | ${skills["Brawling"]}", style: skillLabelStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () => {incrementSkill(skill: "Brawling")}, child: Text("+")),
                ElevatedButton(
                    onPressed: () => {decrementSkill(skill: "Brawling", required: true)}, child: Text("-"))
              ],
            ),

            Text("Evasion (DEX) | ${skills["Evasion"]}", style: skillLabelStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () => {incrementSkill(skill: "Evasion")}, child: Text("+")),
                ElevatedButton(
                    onPressed: () => {decrementSkill(skill: "Evasion", required: true)}, child: Text("-"))
              ],
            ),

            const Text(
                "Performance Skills                                   ",
                style: attrLabelStyle
            ),

            Text("Acting (COOL) | ${skills["Acting"]}", style: skillLabelStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () => {incrementSkill(skill: "Acting")}, child: Text("+")),
                ElevatedButton(
                    onPressed: () => {decrementSkill(skill: "Acting")}, child: Text("-"))
              ],
            ),

            const Text(
                "Ranged Weapon Skills                                   ",
                style: attrLabelStyle
            ),

            Text("Archery (REF) | ${skills["Archery"]}", style: skillLabelStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () => {incrementSkill(skill: "Archery")}, child: Text("+")),
                ElevatedButton(
                    onPressed: () => {decrementSkill(skill: "Archery")}, child: Text("-"))
              ],
            ),

            Text("Autofire (x2) (REF) | ${skills["Autofire"]}", style: skillLabelStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () => {incrementSkill(skill: "Autofire", difficult: true)}, child: Text("+")),
                ElevatedButton(
                    onPressed: () => {decrementSkill(skill: "Autofire", difficult: true)}, child: Text("-"))
              ],
            ),

            Text("Handgun (REF) | ${skills["Handgun"]}", style: skillLabelStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () => {incrementSkill(skill: "Handgun")}, child: Text("+")),
                ElevatedButton(
                    onPressed: () => {decrementSkill(skill: "Handgun")}, child: Text("-"))
              ],
            ),

            const Text(
                "Social Skills                                   ",
                style: attrLabelStyle
            ),

            Text("Conversation (EMP) | ${skills["Conversation"]}", style: skillLabelStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () => {incrementSkill(skill: "Conversation")}, child: Text("+")),
                ElevatedButton(
                    onPressed: () => {decrementSkill(skill: "Conversation", required: true)}, child: Text("-"))
              ],
            ),

            Text("Human Perception (EMP) | ${skills["Human Perception"]}", style: skillLabelStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () => {incrementSkill(skill: "Human Perception")}, child: Text("+")),
                ElevatedButton(
                    onPressed: () => {decrementSkill(skill: "Human Perception", required: true)}, child: Text("-"))
              ],
            ),

            Text("Persuasion (COOL) | ${skills["Persuasion"]}", style: skillLabelStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () => {incrementSkill(skill: "Persuasion")}, child: Text("+")),
                ElevatedButton(
                    onPressed: () => {decrementSkill(skill: "Persuasion", required: true)}, child: Text("-"))
              ],
            ),

            const Text(
                "Technique Skills                                   ",
                style: attrLabelStyle
            ),

            Text("First Aid (TECH) | ${skills["First Aid"]}", style: skillLabelStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () => {incrementSkill(skill: "First Aid")}, child: Text("+")),
                ElevatedButton(
                    onPressed: () => {decrementSkill(skill: "First Aid", required: true)}, child: Text("-"))
              ],
            ),

          ],
        ),
      ),
      floatingActionButton: Padding(
          padding: EdgeInsets.only(left: 30),
          child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            FloatingActionButton(
              onPressed: _cancel,
              tooltip: 'Cancel',
              child: const Icon(Icons.cancel),
            ),
            Expanded(child: Container()),
            FloatingActionButton(
              onPressed: _nextPage,
              tooltip: 'Next',
              child: const Icon(Icons.keyboard_arrow_right),
            ),
          ])),
    );
  }
}
