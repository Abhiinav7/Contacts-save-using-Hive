import 'package:flutter/material.dart';
class MyAppbar extends StatelessWidget implements PreferredSizeWidget{
  
  @override
  Widget build(BuildContext context) {
    return  AppBar(
      toolbarHeight: 100,
        title: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.indigo.shade50,
              borderRadius: BorderRadius.circular(23)),
          child: Row(
            children: [
              IconButton(
                iconSize: 1,
                onPressed: () {},
                icon: Image.asset(
                  "assets/more.png",
                  height: 20,
                  width: 25,
                  color: Colors.black54,
                ),
              ),
              Container(
                height: 45,
                width: 200,
                child: TextField(
                  decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 16),
                      hintText: "Search Contacts", border: InputBorder.none),
                ),
              ),
              IconButton(
                  color: Colors.black54,
                  onPressed: () {},
                  icon: Icon(Icons.more_vert)),
              CircleAvatar(radius: 12,
                child:Icon(Icons.person,
                  color: Colors.black54,
                ) ,)
            ],
          ),
        ));
  }

  @override
 
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
