
// ignore_for_file: file_names

import 'dart:collection';

import 'package:clean_project/features/data/DataSources/DataSourcesPostsRep/DataSourcesPostListRep.dart';
import 'package:clean_project/features/domain/entities/FeedPageList/FeedPageList.dart';
import 'package:clean_project/features/domain/entities/Post/Post.dart';
import 'package:clean_project/features/domain/repositories/Post_Repository/PostListRepository.dart';

class PostListRepositoryImpl implements PostListRepository {
  final DataSourcesPostListRepository dataSources;

  const PostListRepositoryImpl({required this.dataSources});

  @override
  Future<FeedPageList> getFeedPagePosts() => dataSources.getFeedPagePosts();

  @override
  Future<LinkedHashSet<Posts>> getLikedPosts() => dataSources.getLikedPosts();

  @override
  Future<LinkedHashSet<Posts>> getSavedPosts() => dataSources.getSavedPosts();
  
}

