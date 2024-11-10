// ignore_for_file: file_names

import 'package:clean_project/features/domain/entities/ArtistProfile/ArtistProfile.dart';
import 'package:clean_project/features/presentation/widget/PostWidget/PostWidget.dart';
import 'package:flutter/material.dart';

class ArtistProfilePAgePosts extends StatefulWidget {
  final ArtistProfile profileData;

  const ArtistProfilePAgePosts ({ Key? key, required this.profileData }): super(key: key);

  @override
  State<ArtistProfilePAgePosts> createState() => _ArtistProfilePAgePostsState();
}

class _ArtistProfilePAgePostsState extends State<ArtistProfilePAgePosts>{
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.profileData.dummyProfilePosts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 3,
        crossAxisSpacing: 3,
        ), 
      itemBuilder: (context, index) {
        //The InkWell widget allows us to make every post clickable.
        return InkWell(
          //With ShowDialog we create pop up pages.
          onTap:()=> showDialog(
            context: context, 
            builder: (context) {
              return Scaffold(
                backgroundColor: Colors.black,
                appBar: AppBar(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Text(
                    'Skuink',
                    style: TextStyle(
                      fontSize: 24, 
                    ),
                  ),
                  centerTitle: true,
                ),
                //We wrap the body with Material in order to be able to color the backround.
                body:Material(
                  color: Colors.black,
                  type: MaterialType.card,
                  child: 
                  //Center(child: Text("Temporary",style: TextStyle(fontSize: 24, color: Colors.white),))
                  PostWidget(
                     postData: widget.profileData.dummyProfilePosts[index],
                  )
                )
              );
            }
          ),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: widget.profileData.dummyProfilePosts[index].PhotoOfPost,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      }
    );
  }
}