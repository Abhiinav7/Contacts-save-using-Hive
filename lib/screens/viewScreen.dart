import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_study/models/hive_model.dart';
import 'package:hive_study/screens/addcontacts.dart';
import '../widgets/appbar.dart';
import '../widgets/floating button.dart';

import 'editcontacts.dart';

class viewScreen extends StatefulWidget {
  const viewScreen({super.key});

  @override
  State<viewScreen> createState() => _viewScreenState();
}

class _viewScreenState extends State<viewScreen> {
  @override
Box? contactbox;

  @override
void initState() {
    super.initState();
//     Hive.openBox("contacts").then((box) {
//       setState(() {
// contactbox=box;
//       });
//     });
  setState(() {
    contactbox=Hive.box("contacts");
  });
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
      body: ValueListenableBuilder(
        valueListenable:contactbox!.listenable(),
        builder: (context, Box box, child) {
          if(box.isEmpty){
            return Center(
              child:Text("No contacts saved"),
            );
          }
          else {
            List sortedContacts = contactbox!.values.toList();
            sortedContacts.sort((a, b) => a.name.compareTo(b.name));
            return ListView.builder(

              // itemCount: contactbox!.length,
              itemCount: sortedContacts.length,
              itemBuilder: (context, index) {
                // final helper = contactbox!.getAt(index) as HiveModel;
                final helper = sortedContacts[index] as HiveModel;
                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EditContact(
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
                          contactbox!.deleteAt(index);
                        });
                        print("contact deleted");
                      },
                      icon: Icon(Icons.delete)),
                );
              },
            );
          }

        },





          ),
    );
  }
}
