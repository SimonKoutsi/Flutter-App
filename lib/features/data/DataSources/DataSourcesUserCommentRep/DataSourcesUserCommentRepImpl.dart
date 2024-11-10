
// ignore_for_file: file_names

import 'package:clean_project/features/data/DataSources/DataSourcesUserCommentRep/DataSourcesUserCommentRep.dart';
import 'package:clean_project/features/data/MockDataServer/UsersData.dart';
import 'package:clean_project/features/data/MockDataServer/dummyArtistsProfiles.dart';
import 'package:clean_project/features/domain/entities/UserComment/UserComment.dart';
import 'package:clean_project/features/domain/entities/Post/Post.dart';

class DataSourcesUserCommentRepImpl implements DataSourcesUserCommentRepository {
  @override
  Future<List<UserComment>> getInitUserCommentList(Posts post) async{
    List<UserComment> list= post.commenstOfPost;
    return list;
  }

  @override
  Future<List<UserComment>> getUserCommentList(Posts post, String? newComment) async {

      
    if(newComment!=null && newComment!=' ' && newComment.length<101 && newComment.isNotEmpty){
      UserComment comment= UserComment(
        comment: newComment, 
        userWhoCommented: UsersData.user.username
      );
    
      //In the next line I add the new comment of this post in what it would be the server, in a more
      //realistic scenario. In that case i wouldn't update the list with comments with the name of
      //the user that made it but with some users ID. That's because in the case in which a user would
      //change his name, the name on his previous comments would change also, something that is not happening 
      //at this point. 
      dummyArtistsProfiles.dummyProfileList[post.id].dummyProfilePosts[post.postsIndex].commenstOfPost.add(comment);
    }
    List<UserComment> list= post.commenstOfPost;
    return list;
  }

}