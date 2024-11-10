
// ignore_for_file: file_names


import 'package:clean_project/features/domain/entities/ArtistProfile/ArtistProfile.dart';
import 'package:clean_project/features/domain/entities/Follow/Follow.dart';

abstract class FollowRepository {
  Future<Follow> initFollows(ArtistProfile artistProfile);
  Future<Follow> followButtonAction(ArtistProfile artistProfile,bool isfollowing);
}