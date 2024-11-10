
// ignore_for_file: file_names

import 'package:clean_project/features/data/DataSources/DataSourcesLikeButtonRep/DataSourcesLikeButtonRep.dart';
import 'package:clean_project/features/data/MockDataServer/UsersData.dart';
import 'package:clean_project/features/data/MockDataServer/dummyArtistsProfiles.dart';
import 'package:clean_project/features/domain/entities/LikeButton/LikeButton.dart';
import 'package:clean_project/features/domain/entities/Post/Post.dart';

class DataSourcesLikeButtonRepImpl implements DataSourcesLikeButtonRepository {

  @override
  Future<LikeButton> getInitLikeButton(Posts post) async {
    String likesNumber= '${post.likesOfPost}';
    bool isliked;

    if(UsersData.usersLikedPosts.contains(post)==true){
      isliked=true;
    }
    else {
      isliked=false;     
    }
    return LikeButton(isLiked: isliked, likesNumber: likesNumber, profilesId: post.id, postId: post.postsIndex); 
  }

  @override
  Future<LikeButton> getLikeButton(Posts post, bool isLiked) async {
    String likesNumber;
    bool isliked;

    if(isLiked==false){
      UsersData.usersLikedPosts.add(post);
      dummyArtistsProfiles.dummyProfileList[post.id].dummyProfilePosts[post.postsIndex].likesOfPost+=1;
      likesNumber= '${post.likesOfPost}';
    }
    else {
      UsersData.usersLikedPosts.remove(post);
      dummyArtistsProfiles.dummyProfileList[post.id].dummyProfilePosts[post.postsIndex].likesOfPost-=1;
      likesNumber= '${post.likesOfPost}';
    }
    
    isliked=! isLiked;
    return LikeButton(isLiked: isliked, likesNumber: likesNumber, profilesId: post.id, postId: post.postsIndex); 
  }
  
}