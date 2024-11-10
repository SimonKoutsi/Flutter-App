// ignore_for_file: file_names

//This class builds a post.

import 'package:clean_project/features/domain/entities/UserComment/UserComment.dart';
import 'package:flutter/material.dart';

//In more realistic scenario it would be better this class to extend Equetable, in order to compare objects
class Posts {
  String artistProfileName;
  AssetImage artistsProfilePhoto;
  int id;
  int postsIndex;
  AssetImage PhotoOfPost;
  int likesOfPost;
  List<UserComment> commenstOfPost;

  Posts({
    required this.PhotoOfPost,
    required this.likesOfPost,
    required this.commenstOfPost,
    required this.artistProfileName,
    required this.artistsProfilePhoto,
    required this.id,
    required this.postsIndex,
  });
}
