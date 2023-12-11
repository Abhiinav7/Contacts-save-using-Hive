



import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../screens/editcontacts.dart';

class MyListtile extends StatefulWidget {
  String title;
  String subtitle;
  int  id;
  String  name;
  String  phone;

   MyListtile({
     super.key,
     required this.title,
     required this.subtitle,
     required this.id,
     required this.name,
     required this.phone,


   });

  @override
  State<MyListtile> createState() => _MyListtileState();
}

class _MyListtileState extends State<MyListtile> {
  @override
  Widget build(BuildContext context) {

    return ListTile(
      onTap: () {},
      leading: CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Text(widget.title),
      subtitle: Text(widget.subtitle),
      titleTextStyle: TextStyle(
          fontSize: 22,
          color: Colors.black,
          fontWeight: FontWeight.w400
      ),
      subtitleTextStyle: TextStyle(
          fontSize: 14,
          color: Colors.black,
          fontWeight: FontWeight.w400
      ),
      trailing: PopupMenuButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          itemBuilder: (context) {
            return [
             PopupMenuItem(child: TextButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EditContact(
                        index: widget.id,
                        name: widget.name,
                        phone: widget.phone,
                      ),));
                  }, child: Text("Edit"))),
              PopupMenuItem(
                  child: TextButton(
                      onPressed: (){
                        showDialog(
                          useSafeArea: true,
                            context: context, builder: (context) => AlertDialog(
                          scrollable: true,
                          title: Text("Delete"),
                          content: Text("Are you sure !"),
                          actions: [

                            ElevatedButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                  setState(() {

                                  });
                                }, child:Text("cancel")),
                            ElevatedButton(
                                onPressed: (){
                                  Hive.box("contacts").delete(widget.id);
                                  Navigator.pop(context);
                                  setState(() {

                                  });
                                }, child:Text("Yes")),
                          ],

                        ),);
                      },
                      child: Text("Delete"))),



            ];
          }
          ),
    );
  }
}
