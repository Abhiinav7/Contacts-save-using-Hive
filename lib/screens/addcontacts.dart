import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_study/models/hive_model.dart';
import '../widgets/container.dart';

class AddContacts extends StatefulWidget {
   AddContacts({super.key});

  @override
  State<AddContacts> createState() => _AddContactsState();
}

class _AddContactsState extends State<AddContacts> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  void dispose(){
    name.dispose();
    phone.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       titleTextStyle: TextStyle(
         color: Colors.black87,
         fontSize: 22,
         fontWeight: FontWeight.w400
       ),
        title: Text("Create Contact"),
      ),
      body: Column(

      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      MyContainer(
        child: TextField(

          controller: name,
          decoration: InputDecoration(
              hintStyle: TextStyle(
                fontSize: 14,
              ),
              border: InputBorder.none,
              hintText: " Enter Name"),
        ),
      ),
      MyContainer(
        child: TextField(
                  controller: phone,
          decoration: InputDecoration(
              hintStyle: TextStyle(
                fontSize: 14,
              ),
              border: InputBorder.none,
              hintText: " Enter Phone"),
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
            onPressed: () {
    if (name.text.isNotEmpty && phone.text.isNotEmpty) {
      final value = HiveModel(phone: phone.text, name: name.text);

        Hive.box("contacts").add(value);
        print("contacts saved");
      Navigator.pop(context);


    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('Name and phone cannot be empty'),

        ),
      );
    }

            },
            child: Text("Save")),
      )
      ],
      ),
    );
  }
}
