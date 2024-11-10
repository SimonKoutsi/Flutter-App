// ignore_for_file: file_names

import 'dart:collection';

import 'package:clean_project/features/domain/entities/FeedPageList/FeedPageList.dart';
import 'package:clean_project/features/domain/entities/Post/Post.dart';
import 'package:clean_project/features/presentation/cubit/FeedPageCubit/feed_page_cubit.dart';
import 'package:clean_project/features/presentation/pages/FeedPage/FeedPage.dart';
import 'package:clean_project/features/presentation/pages/SearchPage/SearchPage.dart';
import 'package:clean_project/features/presentation/pages/UserProfilePage/UserProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<StatefulWidget> {
  int _selectedIndex = 1;
  FeedPageList feedlist= FeedPageList(feedPageList: LinkedHashSet<Posts>());

  void _navigateBotBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void initFeed() {
    BlocProvider.of<FeedPageCubit>(context).initFeedPage();
    print('Func');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //We use IndexedStack in order to keep the state of each index
      body: IndexedStack(index: _selectedIndex, children: [
        BlocBuilder<FeedPageCubit, FeedPageCubitState>(
          builder: (context, state) {
            if(state is RefreshedFeedPage){
              feedlist= state.initFeedPagestate;
              return FeedPage(feedlist: feedlist);
            }
            else if(state is StartingFeedPage){
              feedlist= state.initFeedPagestate;
              return FeedPage(feedlist:feedlist);
            }        
            else {
              return Text('Exception');
            }
          },
        ), 
        SearchPage(),
        UserProfilePage(),
      ]),
      
      //Bottom bar.
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Color(0xFF48e8b3),
        backgroundColor: Colors.black,
        elevation: 0,
        currentIndex: _selectedIndex,
        onTap: _navigateBotBar,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Feed'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
