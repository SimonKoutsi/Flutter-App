// ignore_for_file: file_names

import 'package:clean_project/features/data/DataSources/DataSourcesArtistProfileRep/DataSourcesArtistProfileRep.dart';
import 'package:clean_project/features/data/MockDataServer/UsersData.dart';
import 'package:clean_project/features/data/MockDataServer/dummyArtistsProfiles.dart';
import 'package:clean_project/features/domain/entities/ArtistProfile/ArtistProfile.dart';

class DataSourcesArtistProfileRepImpl implements DataSourcesArtistProfileRep {
  
  @override
  Future<List<ArtistProfile>> getArtistProfileSearch(String query) async {
    return dummyArtistsProfiles.dummyProfileList.where((element) 
        => element.dummyProfileName.toLowerCase().contains(query.toLowerCase()) 
        || element.dummyGenre.toLowerCase().contains(query.toLowerCase())).toList();
  }

  @override
  Future<List<ArtistProfile>> getArtistProfilInitList() async {
    return List.from(dummyArtistsProfiles.dummyProfileList);
  }

  @override
  Future<List<ArtistProfile>> getUsersFollowingList() async {
    List<ArtistProfile> list= UsersData.usersfollowlist;
    return list;
  }
}