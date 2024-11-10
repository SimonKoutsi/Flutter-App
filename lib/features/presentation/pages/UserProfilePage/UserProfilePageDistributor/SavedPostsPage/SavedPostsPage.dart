// ignore_for_file: file_names

import 'dart:collection';

import 'package:clean_project/features/domain/entities/Post/Post.dart';
import 'package:clean_project/features/presentation/cubit/SavedPostsPage/saved_posts_page_cubit.dart';
import 'package:clean_project/features/presentation/widget/PostWidget/PostWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedPostsPage extends StatefulWidget {
  @override
  State<SavedPostsPage> createState() => _SavedPostsPageState();
}

class _SavedPostsPageState extends State<SavedPostsPage> {
  late LinkedHashSet<Posts> savedPostsList;

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
          'Saved Posts',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: BlocBuilder<SavedPostsPageCubit, SavedPostsPageState>(
        builder: (context, state) {
          if (state is MainSavedPostsPage) {
            savedPostsList= state.savedposts;
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
      itemCount: savedPostsList.length,
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
          //clicks a post from the grid and unsaves it, when he will go back he will se that that specific
          //photo has now been dismissed from the grid.
          onTap: () async {
            await showDialog(
              context: context,
              builder: (context) {
                return Scaffold(
                  backgroundColor: Colors.black,
                  appBar: AppBar(
                    foregroundColor: Colors.white,
                    elevation: 0,
                    backgroundColor: Colors.transparent,
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
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                        child: PostWidget(
                          postData: savedPostsList.elementAt(index),
                        ),
                      )
                  )
                );
              }
            );
            await BlocProvider.of<SavedPostsPageCubit>(context).getSavedPostsList();
          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: savedPostsList.elementAt(index).PhotoOfPost,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      }
    );
  }
}
