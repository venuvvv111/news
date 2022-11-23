import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> users = [];

  Icon cusIcon = const Icon(Icons.search);
  Widget cusSearchBar = const Text('QNews');
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          leading: GestureDetector(
              onTap: () {
                fetch();
                setState(() {
                  if (cusIcon.icon == Icons.search) {
                    cusIcon = const Icon(Icons.cancel);
                    cusSearchBar = const TextField(
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.white),
                          hintText: 'Search in feed',
                          focusColor: Colors.white),
                      textInputAction: TextInputAction.go,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    );
                  } else {
                    cusIcon = const Icon(Icons.search);
                    cusSearchBar = const Text('QNews');
                  }
                });
              },
              child: cusIcon),
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: cusSearchBar,
        ),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index] ?? [];
            final title = user!['title'];
            final disc = user!['description'];
            final source = user!['source']!['name'];

            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Card(
                      shadowColor: Colors.black,
                      elevation: 20,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                source,
                                style: const TextStyle(fontSize: 9),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                title,
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                disc,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 96, 151, 197),
                                ),
                              )
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  void fetch() async {
    const url =
        'https://newsapi.org/v2/everything?q=tesla&from=2022-10-22&sortBy=publishedAt&apiKey=4f63681140c84fe6a9d781bedb2e4472';
    final uri = Uri.parse(url);
    final responce = await http.get(uri);
    final body = responce.body;
    final json = jsonDecode(body);
    setState(() {
      users = json!['articles'];
    });
  }
}
