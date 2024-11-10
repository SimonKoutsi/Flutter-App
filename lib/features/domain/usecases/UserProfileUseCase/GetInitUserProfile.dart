
// ignore_for_file: file_names

import 'package:clean_project/features/domain/entities/UserProfile/UserProfile.dart';
import 'package:clean_project/features/domain/repositories/UserProfile_Repository/UserProfileRepository.dart';

class GetInitUserProfile {
  final UserProfileRepository repository;

  const GetInitUserProfile({required this.repository});

  Future<UserProfile> call() async {
    return await repository.getInitUserProfile();
  }
}