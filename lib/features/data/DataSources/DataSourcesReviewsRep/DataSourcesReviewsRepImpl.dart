
// ignore_for_file: file_names

import 'package:clean_project/features/data/MockDataServer/UsersData.dart';
import 'package:clean_project/features/data/MockDataServer/dummyArtistsProfiles.dart';
import 'package:clean_project/features/domain/entities/UserComment/UserComment.dart';

import 'DataSourcesReviewsRep.dart';

class DataSourcesReviewsRepImpl implements DataSourcesReviewsRepository {
  @override
  Future<List<UserComment>> getInitReviewsList(int artistProfileId) async{
    List<UserComment> list= dummyArtistsProfiles.dummyProfileList[artistProfileId].dummyReviews;
    return list;
  }

  @override
  Future<List<UserComment>> getReviewsList(int artistProfileId, String? newReview) async {

    if(newReview!=null && newReview!=' ' && newReview.length<101 && newReview.isNotEmpty){
      UserComment review= UserComment(
        comment: newReview, 
        userWhoCommented: UsersData.user.username
      );
    
      //In the next line I add the new review of this post in what it would be the server, in a more
      //realistic scenario. In that case i wouldn't update the list with reviews with the name of
      //the user that made it but with some users ID. That's because in the case in which a user would
      //change his name, the name on his previous reviews would change also, something that is not happening 
      //at this point. 
      dummyArtistsProfiles.dummyProfileList[artistProfileId].dummyReviews.add(review);
    }
    List<UserComment> list= dummyArtistsProfiles.dummyProfileList[artistProfileId].dummyReviews;
    return list;
  }

}