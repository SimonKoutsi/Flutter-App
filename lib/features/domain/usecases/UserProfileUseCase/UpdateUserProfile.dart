
// ignore_for_file: file_names

import 'package:clean_project/features/domain/entities/UserProfile/UserProfile.dart';
import 'package:clean_project/features/domain/repositories/UserProfile_Repository/UserProfileRepository.dart';

class UpdateUserProfile {
  final UserProfileRepository repository;

  const UpdateUserProfile({required this.repository});

  Future<bool> call(UserProfile userProfile) async {
    return await repository.updateUserProfile(userProfile);
  }
}