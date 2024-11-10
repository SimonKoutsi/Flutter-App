
// ignore_for_file: file_names

import 'dart:collection';

import 'package:clean_project/features/domain/entities/Post/Post.dart';

class FeedPageList {
  final LinkedHashSet<Posts> feedPageList;

  const FeedPageList({required this.feedPageList});
}