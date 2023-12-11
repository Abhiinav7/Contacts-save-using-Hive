import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_study/models/hive_model.dart';
import '../widgets/container.dart';

class EditContact extends StatefulWidget {
  String name;
  String phone;
  int index;

  EditContact(
      {super.key,
      required this.phone,
      required this.name,
      required this.index});

  @override
  State<EditContact> createState() => _EditContactState();
}

class _EditContactState extends State<EditContact> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  void initState() {
    name.text = widget.name;
    phone.text = widget.phone;
    super.initState();
  }

  @override
  void dispose() {
    name.dispose();
    phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: TextStyle(
            color: Colors.black87, fontSize: 22, fontWeight: FontWeight.w400),
        title: Text("Edit Contact"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyContainer(
            child: TextFormField(
              controller: name,
              decoration: InputDecoration(
                  hintStyle: TextStyle(
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                  hintText: widget.name),
            ),
          ),
          MyContainer(
            child: TextFormField(
              controller: phone,
              decoration: InputDecoration(
                  hintStyle: TextStyle(
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                  hintText: widget.phone),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
                onPressed: () {
                  final value = HiveModel(phone: phone.text, name: name.text);
                  Hive.box("contacts").putAt(widget.index, value);
                  print("contacts updated");
                  Navigator.pop(context);
                },
                child: Text("Update")),
          )
        ],
      ),
    );
  }
}
