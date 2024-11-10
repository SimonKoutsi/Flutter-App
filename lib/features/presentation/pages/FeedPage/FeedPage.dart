// ignore_for_file: file_names


import 'package:clean_project/features/domain/entities/FeedPageList/FeedPageList.dart';
import 'package:clean_project/features/presentation/cubit/FeedPageCubit/feed_page_cubit.dart';
import 'package:clean_project/features/presentation/widget/PostWidget/PostWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedPage extends StatefulWidget {
  final FeedPageList feedlist;
  const FeedPage({Key? key, required this.feedlist}) : super(key: key);

  @override
  State<FeedPage> createState() => FeedPageState();
}

class FeedPageState extends State<FeedPage> {

  Future<void> refreshFeed() async {
    await BlocProvider.of<FeedPageCubit>(context).refreshedFeedPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Skuink',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: buildFeedPage(widget.feedlist)
    );
  }

  Widget buildFeedPage(FeedPageList feedlist) {
    //With thiw widget 'RefreshIndicator' the user can refresh the Feed page manually by scrolling the page down.
    //At this point is not actually usefull because the page refreshes every time we tap the "Feed" icon.
    return RefreshIndicator(
      onRefresh: refreshFeed,
      child: ListView.builder(
        itemCount: feedlist.feedPageList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: PostWidget(
            postData: feedlist.feedPageList.elementAt(index),
          ),
        )
      ),
    );
  }

}
