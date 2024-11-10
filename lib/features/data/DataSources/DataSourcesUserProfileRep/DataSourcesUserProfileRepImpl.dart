
// ignore_for_file: file_names

import 'package:clean_project/features/data/DataSources/DataSourcesUserProfileRep/DataSourcesUserProfileRep.dart';
import 'package:clean_project/features/data/MockDataServer/UsersData.dart';
import 'package:clean_project/features/domain/entities/UserProfile/UserProfile.dart';

class DataSourcesUserProfileRepImpl implements DataSourcesUserProfileRepository {
  
  @override
  Future<bool> updateUserProfile(UserProfile userProfile) async {
    UsersData.user.username= userProfile.username;
    UsersData.user.usersEmail= userProfile.usersEmail;

    return true; 
  }

  @override
  Future<UserProfile> getInitUserProfile() async {
    UserProfile initUserProfile=UserProfile(username: '', usersEmail: '');
    initUserProfile.username= UsersData.user.username;
    initUserProfile.usersEmail= UsersData.user.usersEmail;

    return initUserProfile;
  }

}