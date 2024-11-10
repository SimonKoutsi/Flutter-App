//The class that contains data regarding the user. Implements a part of our local data base.

// ignore_for_file: file_names

import 'dart:collection';

import 'package:clean_project/features/domain/entities/ArtistProfile/ArtistProfile.dart';
import 'package:clean_project/features/domain/entities/Post/Post.dart';
import 'package:clean_project/features/domain/entities/UserProfile/UserProfile.dart';

class UsersData {
  static List<ArtistProfile> usersfollowlist= [];
  static LinkedHashSet<Posts> usersLikedPosts= LinkedHashSet<Posts>();
  static LinkedHashSet<Posts> usersSavedPosts= LinkedHashSet<Posts>();
  static UserProfile user= UserProfile(
    username: 'Username123', 
    usersEmail: 'random@example.com'
  );
}
