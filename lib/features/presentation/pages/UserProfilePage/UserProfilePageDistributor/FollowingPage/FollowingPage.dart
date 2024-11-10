// ignore_for_file: file_names

import 'package:clean_project/features/domain/entities/ArtistProfile/ArtistProfile.dart';
import 'package:clean_project/features/presentation/cubit/UsersFollowingPageCubit/users_following_page_cubit.dart';
import 'package:clean_project/features/presentation/pages/ArtistProfilePage/ArtistProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FollowingPage extends StatefulWidget {
  @override
  State<FollowingPage> createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  late List<ArtistProfile> followinglist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Following',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: BlocBuilder<UsersFollowingPageCubit, UsersFollowingPageState>(
        builder: (context, state) {
          if (state is UsersFollowingPage){
            followinglist= state.followinglist;
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
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.black,
          Color(0xFF5f1da1),
          Color(0xFF48e8b3),
        ], stops: [
          0.3,
          0.6,
          1
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          height: 1.0,
          thickness: 0.6,
        ),
        itemCount: followinglist.length,
        //With the following command we dismiss the keyboard every time we scroll.
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemBuilder: (context, index) => ListTile(
          contentPadding: EdgeInsets.all(8.0),
          title: Text(
            followinglist[index].dummyProfileName,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            followinglist[index].dummyGenre,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          leading: Container(
            height: 60.0,
            width: 60.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: followinglist[index].dummyProfilePhoto,
                fit: BoxFit.cover,
              ),
            ),
          ),
          //By using the async-await combo, the setState method awaits until the Navigator
          //'pops' the other page that the user had been navigated to and only then it sets the
          //new state
          onTap: () async {
            await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ArtistsProfilePage(
                      artistProfiledata: followinglist[index],
                    )));
            await BlocProvider.of<UsersFollowingPageCubit>(context).getUsersFollowinList();
          },
        ),
      ),
    );
  }
}
