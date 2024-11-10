
// ignore_for_file: file_names

import 'package:clean_project/features/domain/entities/UserProfile/UserProfile.dart';

abstract class DataSourcesUserProfileRepository {

  Future<bool> updateUserProfile(UserProfile userProfile);
  Future<UserProfile> getInitUserProfile();

}