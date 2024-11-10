
// ignore_for_file: file_names

import 'package:clean_project/features/data/DataSources/DataSourcesArtistProfileRep/DataSourcesArtistProfileRep.dart';
import 'package:clean_project/features/domain/entities/ArtistProfile/ArtistProfile.dart';
import 'package:clean_project/features/domain/repositories/ArtistProfile_Repository/ArtistProfile_repository.dart';

class ArtistProfileRepositoryImpl implements ArtistProfileRepository {
  final DataSourcesArtistProfileRep dataSource;

  const ArtistProfileRepositoryImpl({required this.dataSource});
  
  @override
  Future<List<ArtistProfile>> getArtistProfileSearch(String query) => dataSource.getArtistProfileSearch(query);

  @override
  Future<List<ArtistProfile>> getArtistProfilInitList() => dataSource.getArtistProfilInitList();

  @override
  Future<List<ArtistProfile>> getUsersFollowingList() => dataSource.getUsersFollowingList();
}