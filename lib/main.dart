import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'character_page.dart';
import 'chargen_attributes.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FLATLINE',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'FLATLINE'),
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
  List _characters = [];

  //Read characters from Characters.json in app documents directory
  //If no such file exists, create one.
  Future<void> readJson({bool alert=false}) async {
    try {
      //get directory
      final Directory directory = await getApplicationDocumentsDirectory();
      //open file
      final File file = File('${directory.path}/Characters.json');
      //await and decode response
      final String response = await file.readAsString();
      final data = await jsonDecode(response);
      setState(() {
        //if successful, load into _characters
        _characters = data["Characters"];
        print("..Number of characters ${_characters.length}");
        print("..Contents of characters[]:\n $_characters");
        //if _characters is empty, i.e. no characters, popup alert dialogue that there are no characters
        //only show if alert is true
        if (alert && _characters.length == 0) {showNoCharAlert();}
      });
    }
    catch (e) {
      //if characters.json does not exist, i.e. first time opening app, create a new json in local directory
      print("... File not found\n... Creating Characters.json...");
      String text = '{"Characters": []}';
      final Directory directory = await getApplicationDocumentsDirectory();
      final File file = File('${directory.path}/Characters.json');
      await file.writeAsString(text);
    }
  }

  //show alert dialogue saying there are no characters.
  void showNoCharAlert()
  {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.black,
        title: const Text("No Characters", style: TextStyle(color: Colors.white)),
        content: const Text("Press the + button in the bottom right corner to make a new character.", style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Center(
                  child: Container(
                    color: Colors.red,
                    padding: const EdgeInsets.all(14),
                    child: const Text("OK", style: TextStyle(color: Colors.white)),
                  )
              )
          ),
        ],
      ),
    );
  }

  //delete all characters
  void deleteAll()
  {
    while(_characters.isNotEmpty)
    {
      deleteCharacter(0);
    }
  }

  //delete character at a given index
  Future<void> deleteCharacter(int index)
  async {
    //delete character at index
    _characters.removeAt(index);

    //save changes
    Map jsonMap = Map();
    jsonMap["Characters"] = _characters;
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/Characters.json');
    final String toSave = jsonEncode(jsonMap);
    file.writeAsString(toSave);
    print("..Contents of Characters.json:\n$toSave");
  }

  //Show deletion confirmation dialogue on long press of character card
  void confirmDeletion(int index)
  {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.black,
        title: const Text("Delete Character?", style: TextStyle(color: Colors.white)),
        content: Text("Would you like to permanently delete ${_characters[index]["Name"]}? "
            "This action cannot be undone.", style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                deleteCharacter(index);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(title: "CHARACTER DELETED"),
                  ),
                );
              },
              child: Center(
                  child: Container(
                    color: Colors.red,
                    padding: const EdgeInsets.all(8),
                    child: const Text("YES, DELETE", style: TextStyle(color: Colors.white)),
                  )
              )
          ),
          TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Center(
                  child: Container(
                    color: Colors.red,
                    padding: const EdgeInsets.all(8),
                    child: const Text("NO", style: TextStyle(color: Colors.white)),
                  )
              )
          ),
        ],
      ),
    );
  }

  //create a new character, i.e. go to chargen page path
  void _newCharacter() {
    //read JSON in case it hasn't been already, i.e. user doesn't click on display
    // characters button before creating a new character
    readJson();
    //go to next page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyChargenAttrPage(title: 'ASSIGN ATTRIBUTES', characters: _characters,))
    );
  }

  //UI, on button click, read from JSON and display a list of cards with basic character information
  //Click on a card to view the character in detail
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _newCharacter,
        tooltip: 'Create New',
        child: const Icon(Icons.add),
      ),

      body:Column(
        children: [
          _characters.isNotEmpty?Expanded(
              child: ListView.builder(
                  itemCount: _characters.length,
                  itemBuilder: (context, index) {
                    return Card(
                        key: ValueKey(_characters[index]["Name"]),
                        margin: const EdgeInsets.all(10),
                        color: Colors.red,
                        child: ListTile(
                            leading: Text("${index+1}", style:const TextStyle(color: Colors.white)),
                            title: Text(_characters[index]["Name"], style:const TextStyle(color: Colors.white)),
                            subtitle: Text(_characters[index]["Role Info"]["Role"], style:const TextStyle(color: Colors.white)),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyCharacterPage(title: _characters[index]["Name"], character: _characters[index],),
                                ),
                              );
                            },
                            onLongPress: ()
                            {
                              confirmDeletion(index);
                            },
                        )
                    );
                  }
              )
          ): ElevatedButton(
            onPressed: () {
              readJson(alert:true);
            },
            child: Center(child: Text("ENTER THE NET")),
          )
        ],
      )
    );
  }
}
