// ignore_for_file: file_names

import 'dart:collection';

import 'package:clean_project/features/domain/entities/Post/Post.dart';
import 'package:clean_project/features/presentation/cubit/LikedPostsPage/liked_posts_page_cubit.dart';
import 'package:clean_project/features/presentation/widget/PostWidget/PostWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LikedPostsPage extends StatefulWidget {
  @override
  State<LikedPostsPage> createState() => _LikedPostsPageState();
}

class _LikedPostsPageState extends State<LikedPostsPage> {
  late LinkedHashSet<Posts> likedPostsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Liked Posts',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: BlocBuilder<LikedPostsPageCubit, LikedPostsPageState>(
        builder: (context, state) {
          if (state is MainLikedPostsPage){
            likedPostsList= state.likedposts;
            return _buildBody();
          }
          else{
            return Text('Exception');
          }
        },
      ),
    );
  }

  Widget _buildBody() {
    return GridView.builder(
        itemCount: likedPostsList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 3,
          crossAxisSpacing: 3,
        ),
        itemBuilder: (context, index) {
          //We use InkWell to make every post clickable.
          return InkWell(
            //By making the onTap method async we get the opportunity to await the users interaction
            //in the "showDialog" method and then call the "setState" method. For example if the user
            //clicks a post from the grid and dislikes it, when he will go back he will se that that specific
            //photo has now been dismissed from the grid.
            onTap: () async {
              await showDialog(
                  context: context,
                  builder: (context) {
                    return Scaffold(
                        backgroundColor: Colors.black,
                        appBar: AppBar(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          title: Text(
                            'Skuink',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                          centerTitle: true,
                        ),
                        body: Material(
                            type: MaterialType.card,
                            child: Container(
                              decoration: BoxDecoration(color: Colors.black),
                              child: PostWidget(
                                postData: likedPostsList.elementAt(index),
                              ),
                            )));
                  });
              await BlocProvider.of<LikedPostsPageCubit>(context).getLikedPostsList();  
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: likedPostsList.elementAt(index).PhotoOfPost,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        });
  }
}
