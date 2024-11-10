
// ignore_for_file: file_names

import 'package:clean_project/features/data/DataSources/DataSourcesFollowRep/DataSourcesFollowRep.dart';
import 'package:clean_project/features/domain/entities/Follow/Follow.dart';
import 'package:clean_project/features/domain/entities/ArtistProfile/ArtistProfile.dart';
import 'package:clean_project/features/domain/repositories/Follow_Repository/FollowRepository.dart';

class FollowRepositoryImpl implements FollowRepository{
  final DataSourcesFollowRepository dataSources;

  const FollowRepositoryImpl({required this.dataSources});

  @override
  Future<Follow> initFollows(ArtistProfile artistProfile) => dataSources.initFollows(artistProfile);

  @override
  Future<Follow> followButtonAction(ArtistProfile artistProfile, bool isfollowing) => dataSources.followButtonAction(artistProfile, isfollowing);

}