
// ignore_for_file: file_names, unused_import

import 'dart:collection';

import 'package:clean_project/features/data/DataSources/DataSourcesFollowRep/DataSourcesFollowRep.dart';
import 'package:clean_project/features/data/DataSources/DataSourcesPostsRep/DataSourcesPostListRep.dart';
import 'package:clean_project/features/data/MockDataServer/FeedPageData.dart';
import 'package:clean_project/features/data/MockDataServer/UsersData.dart';
import 'package:clean_project/features/domain/entities/FeedPageList/FeedPageList.dart';
import 'package:clean_project/features/domain/entities/Post/Post.dart';

class DataSourcesPostListRepImpl extends DataSourcesPostListRepository {

  @override
  Future<FeedPageList> getFeedPagePosts() async {
    FeedPageList feedPostsList= FeedPageList(feedPageList: LinkedHashSet<Posts>());

    //If i simply did <<final FeedPageList feedPostsList= FeedPageList(feedPageList: FeedPageData.feedPosts);>>
    //this would mean that i would have a referenced equality for the 2 object ( feedPostList and FeedPageData).
    //That would lead to the FeedPage page being automatically 'notified' every time data where updated in my 
    //fake server implimentation. 
    feedPostsList.feedPageList.addAll(FeedPageData.feedPosts);
    return feedPostsList;
  }

  @override
  Future<LinkedHashSet<Posts>> getLikedPosts() async {
    LinkedHashSet<Posts> list = UsersData.usersLikedPosts;
    return list;
  }

  @override
  Future<LinkedHashSet<Posts>> getSavedPosts() async {
    LinkedHashSet<Posts> list = UsersData.usersSavedPosts;
    return list;
  }

}