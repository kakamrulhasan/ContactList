import 'package:flutter/material.dart';
import 'package:flutter_application_38/contact.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Contact> contacts = List.empty(growable: true);
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
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
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  hintText: 'Contact',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: contactController,
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
                ElevatedButton(
                    onPressed: () {
                      String name = nameController.text.trim();
                      String contact = contactController.text.trim();
                      if (name.isNotEmpty && contact.isNotEmpty) {
                        setState(() {
                          nameController.text = '';
                          contactController.text = '';
                          contacts.add(Contact(name: name, contact: contact));
                        });
                      }
                    },
                    child: Text('Add')),
                    ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) => getRow(index),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return Card(
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contacts[index].name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            ),
            Text(contacts[index].contact),
          ],
        ),
        trailing: SizedBox(
          width: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                  onTap: () {
                    setState(() {
                      contacts.removeAt(index);
                    });
                  },
                  child: Icon(Icons.delete)),
              InkWell(
                  onTap: () {
                    setState(() {
                      nameController.text = contacts[index].name;
                      contactController.text = contacts[index].contact;
                    });
                  },
                  child: Icon(Icons.edit))
            ],
          ),
        ),
      ),
    );
  }
}
