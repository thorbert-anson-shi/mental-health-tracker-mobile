import 'package:flutter/material.dart';
import 'package:mental_health_tracker/widgets/mood_card.dart';
import 'package:mental_health_tracker/widgets/left_drawer.dart';

class MyHomePage extends StatelessWidget {
  final String npm = "2306221900";
  final String name = "Thorbert Anson Shi";
  final String className = "PBP E";
  final List<ItemHomePage> items = [
    ItemHomePage("Lihat Mood", Icons.mood),
    ItemHomePage("Tambah Mood", Icons.add),
    ItemHomePage("Logout", Icons.logout),
  ];

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mental Health Tracker",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: "NPM", content: npm),
                InfoCard(title: "Name", content: name),
                InfoCard(title: "Class", content: className),
              ],
            ),
            const SizedBox(height: 16.0),
            Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text("Welcome to Mental Health Tracker",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0)),
                  ),
                  GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(20.0),
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    shrinkWrap: true,
                    children: items.map((ItemHomePage item) {
                      return ItemCard(item);
                    }).toList(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content)
          ],
        ),
      ),
    );
  }
}
