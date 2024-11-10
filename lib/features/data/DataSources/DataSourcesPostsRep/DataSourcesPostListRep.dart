
// ignore_for_file: file_names

import 'dart:collection';

import 'package:clean_project/features/domain/entities/FeedPageList/FeedPageList.dart';
import 'package:clean_project/features/domain/entities/Post/Post.dart';

abstract class DataSourcesPostListRepository {
  
  //For the 'GetFeedPagePosts' use case
  Future<FeedPageList> getFeedPagePosts();

  //For the 'GetLikedPosts' use case
  Future<LinkedHashSet<Posts>> getLikedPosts();

  //For the 'GetSavedPosts' use case
  Future<LinkedHashSet<Posts>> getSavedPosts();
}