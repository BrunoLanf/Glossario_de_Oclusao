import 'package:flutter/material.dart';
import 'package:projeto/view/profile_page.dart';

import '../utils/glossary.dart';
import 'quiz_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _foundGlossary = [];
  @override
  initState() {
    _foundGlossary = Glossary.allGlossary;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = Glossary.allGlossary;
    } else {
      results = Glossary.allGlossary
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundGlossary = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.account_circle_sharp,
            size: 35.0,
          ),
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ProfilePage())),
        ),
        title: const Text('Glossário', style: TextStyle(fontSize: 25)),
        actions: [
          IconButton(
              onPressed: () {
                openSobre();
              },
              icon: const Icon(Icons.quiz))
        ],
        backgroundColor: const Color.fromARGB(255, 59, 19, 150),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  labelText: 'Pesquisa', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundGlossary.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundGlossary.length,
                      itemBuilder: (context, index) => Card(
                        color: const Color.fromARGB(255, 223, 236, 247),
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          title: Text(_foundGlossary[index]['name'],
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 25)),
                          subtitle: Text(
                              _foundGlossary[index]["exp"].toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18)),
                        ),
                      ),
                    )
                  : const Text(
                      'Nada encontrado',
                      style: TextStyle(fontSize: 24, color: Colors.grey),
                    ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xffE3F2FD),
    );
  }

  Future openSobre() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("QUESTIONÁRIO"),
          content: const Text("Gostaria de começar o questionário?"),
          actions: [
            TextButton(
                onPressed: submit,
                child: const Text('Começar',
                    style: TextStyle(color: Colors.black))),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child:
                    const Text('Voltar', style: TextStyle(color: Colors.black)))
          ],
          backgroundColor: const Color(0xffE3F2FD),
        ),
      );

  void submit() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const QuizScreen1()));
  }
}
