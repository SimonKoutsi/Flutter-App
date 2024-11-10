// ignore_for_file: file_names

import 'package:clean_project/features/domain/entities/ArtistProfile/ArtistProfile.dart';

abstract class ArtistProfileRepository {
  //For the 'GetArtistProfilesUseCase'
  Future<List<ArtistProfile>> getArtistProfileSearch(String query);
  Future<List<ArtistProfile>> getArtistProfilInitList();

  //For the 'GetUsersFollowingListUseCase'
  Future<List<ArtistProfile>> getUsersFollowingList();
}