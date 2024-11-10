// ignore_for_file: file_names

//This claass builds an Artist profile.

import 'package:clean_project/features/domain/entities/Post/Post.dart';
import 'package:clean_project/features/domain/entities/UserComment/UserComment.dart';
import 'package:flutter/material.dart';

class ArtistProfile {
  final int id;
  final String dummyProfileName;
  final AssetImage dummyProfilePhoto;
  final String dummyGenre;
  int followers;
  List<Posts> dummyProfilePosts;
  List<UserComment> dummyReviews;

  ArtistProfile ({
    required this.id,
    required this.dummyProfileName,
    required this.dummyProfilePhoto,
    required this.dummyGenre,
    required this.followers,
    required this.dummyProfilePosts,
    required this.dummyReviews
  });

}