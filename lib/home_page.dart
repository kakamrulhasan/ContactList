import 'package:flutter/material.dart';
import 'package:flutter_application_38/contact.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Contact> contacts = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text('Contacts List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  hintText: 'Contact',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'Number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {}, child: Text('SAVE')),
                ElevatedButton(onPressed: () {}, child: Text('Update')),
              ],
            ),
            ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) => getRow(),
            )
          ],
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return ListTile(
      title: Column(
        children: [
          Text(contacts[index].name),
          Text(contacts[index].contact),
        ],
      ),
    );
  }
}
