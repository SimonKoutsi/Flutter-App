
// ignore_for_file: file_names

import 'package:clean_project/features/data/DataSources/DataSourcesUserProfileRep/DataSourcesUserProfileRep.dart';
import 'package:clean_project/features/domain/entities/UserProfile/UserProfile.dart';
import 'package:clean_project/features/domain/repositories/UserProfile_Repository/UserProfileRepository.dart';

class UserProfileRepositoryImpl implements UserProfileRepository {
  final DataSourcesUserProfileRepository dataSources;

  const UserProfileRepositoryImpl({required this.dataSources});
  
  @override
  Future<bool> updateUserProfile(UserProfile userProfile) => dataSources.updateUserProfile(userProfile);

  @override
  Future<UserProfile> getInitUserProfile() => dataSources.getInitUserProfile();
  
}