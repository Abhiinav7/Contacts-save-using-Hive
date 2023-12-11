import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_study/models/hive_model.dart';
import 'package:hive_study/screens/addcontacts.dart';
import '../widgets/appbar.dart';
import '../widgets/floating button.dart';

import 'editcontacts.dart';

class view_contacts extends StatefulWidget {
  const view_contacts({super.key});

  @override
  State<view_contacts> createState() => _view_contactsState();
}

class _view_contactsState extends State<view_contacts> {
  @override
  void dispose() {
    Hive.box('contacs').close();
    super.dispose();
  }
  Future<void> openBox() async {
    await Hive.openBox("contacts");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: MyFloating(
        icon: Icon(Icons.add),
        tip: 'Add',
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddContacts(),
              ));
          setState(() {

          });
        },
      ),
      appBar: MyAppbar(),
      body: FutureBuilder(
          future: openBox(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final contactsBox = Hive.box("contacts");
              List sortedContacts = contactsBox.values.toList();
              sortedContacts.sort((a, b) => a.name.compareTo(b.name));
              return ValueListenableBuilder(
                valueListenable: contactsBox.listenable(),
                builder: (context, value, child) {
                  return ListView.builder(
                    //itemCount: contactsBox.length,
                    itemCount: sortedContacts.length,
                    itemBuilder: (context, index) {
                      // final helper = contactsBox.getAt(index) as HiveModel;
                      final helper = sortedContacts[index] as HiveModel;
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditContact(
                                  phone: helper.phone,
                                  name: helper.name,
                                  index: index,
                                ),
                              ));
                        },
                        subtitle: Text(helper.phone),
                        title: Text(helper.name),
                        trailing: IconButton(
                            onPressed: () {
                              setState(() {
                                contactsBox.deleteAt(index);
                              });
                              print("contact deleted");
                            },
                            icon: Icon(Icons.delete)),
                      );
                    },
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
