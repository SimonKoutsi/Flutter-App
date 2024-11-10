
// ignore_for_file: file_names


import 'package:clean_project/features/data/DataSources/DataSourcesFollowRep/DataSourcesFollowRep.dart';
import 'package:clean_project/features/data/MockDataServer/FeedPageData.dart';
import 'package:clean_project/features/data/MockDataServer/dummyArtistsProfiles.dart';
import 'package:clean_project/features/domain/entities/Follow/Follow.dart';
import 'package:clean_project/features/domain/entities/ArtistProfile/ArtistProfile.dart';
import 'package:clean_project/features/data/MockDataServer/UsersData.dart';

class DataSourceFollowRepositoryImpl implements DataSourcesFollowRepository{
  
  @override
  Future<Follow> initFollows(ArtistProfile artistProfile) async {
    String followText= 'Follow';
    String followNumber= '${artistProfile.followers}';
    bool isFollowing= false;
    
     UsersData.usersfollowlist.forEach((element) { 
      if(element==artistProfile){
        followText='Unfollow';
        followNumber='${artistProfile.followers}';
        isFollowing= true;
      }
    });

    return Follow(followers: followNumber, following: isFollowing, followButtonText: followText);
  }

  @override
  Future<Follow> followButtonAction(ArtistProfile artistProfile, bool isfollowing) async {
    String followText;
    String followNumber;
    bool isFollowing= isfollowing;

    if(isfollowing==true){
      followText='Follow';

      UsersData.usersfollowlist.removeWhere((element) => element.dummyProfileName==artistProfile.dummyProfileName);
      FeedPageData.feedPosts.removeAll(artistProfile.dummyProfilePosts);
      dummyArtistsProfiles.dummyProfileList[artistProfile.id].followers-=1;

      followNumber= '${artistProfile.followers}';
    }
    else{
      followText='Unfollow';

      UsersData.usersfollowlist.add(artistProfile);
      FeedPageData.feedPosts.addAll(artistProfile.dummyProfilePosts);
      dummyArtistsProfiles.dummyProfileList[artistProfile.id].followers+=1;

      followNumber= '${artistProfile.followers}';
    }

    isFollowing=! isfollowing;

    return Follow(followers: followNumber, following: isFollowing, followButtonText: followText);
    }
}