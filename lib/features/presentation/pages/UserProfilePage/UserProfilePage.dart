// ignore_for_file: file_names

import 'package:clean_project/features/presentation/pages/UserProfilePage/UserProfilePageDistributor/UserProfilePageDistributor.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  final List<String> listTileTitles= ['Edit Profile', 'Following', 'Liked Posts', 'Saved Posts'];
  final List<Icon> listTileIcons= [
    Icon(Icons.edit, color: Color(0xFF48e8b3),),
    Icon(Icons.person_add_outlined, color: Color(0xFF48e8b3)),
    Icon(Icons.favorite_border_sharp,color: Color(0xFF48e8b3) ),
    Icon(Icons.bookmark_outline_sharp, color: Color(0xFF48e8b3))
  ];
  
  //The "username" gets notidied every time the user changes hes name on the "Edit profile" page.
  static ValueNotifier<String> username = ValueNotifier('Username123');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'My Profile',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: ValueListenableBuilder(
              valueListenable: username, 
              builder: (BuildContext context, String newValue, child) 
                => Text(
                  '@$newValue',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: Colors.white
                  ),
                ), 
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 4,
              separatorBuilder: (context, index) => Divider(height: 10.0, thickness: 1.5,color: Color(0xFF5f1da1),),
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  listTileTitles[index],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
                leading: listTileIcons[index],
                trailing: Icon(Icons.arrow_forward_ios, color: Color(0xFF48e8b3),),
                onTap: () { Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=> UserProfilePageDistributor(index: index))); 
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}