// ignore_for_file: file_names

import 'dart:collection';

import 'package:clean_project/features/domain/entities/Post/Post.dart';


//We keep a list with the posts that are going to demonstrate in the feed page. This list could 
//be also usefull in case we wanted to sort the list in a specific way.
class FeedPageData {
  static LinkedHashSet<Posts> feedPosts= LinkedHashSet<Posts>(); 
}