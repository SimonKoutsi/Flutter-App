
// ignore_for_file: file_names

import 'package:clean_project/features/domain/entities/ArtistProfile/ArtistProfile.dart';

abstract class DataSourcesArtistProfileRep {
  Future<List<ArtistProfile>> getArtistProfileSearch(String query);
  Future<List<ArtistProfile>> getArtistProfilInitList();

  Future<List<ArtistProfile>> getUsersFollowingList();
  
}