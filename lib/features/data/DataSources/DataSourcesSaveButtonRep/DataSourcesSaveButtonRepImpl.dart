
// ignore_for_file: file_names

import 'package:clean_project/features/data/DataSources/DataSourcesSaveButtonRep/DataSourcesSaveButtonRep.dart';
import 'package:clean_project/features/data/MockDataServer/UsersData.dart';
import 'package:clean_project/features/domain/entities/SaveButton/SaveButton.dart';
import 'package:clean_project/features/domain/entities/Post/Post.dart';

class DataSourcesSaveButtonRepImpl implements DataSourcesSaveButtonRepository {

  @override
  Future<SaveButton> getInitSaveButton(Posts post) async {
    bool isSaved;

    if(UsersData.usersSavedPosts.contains(post)==true){
      isSaved=true;
    }
    else{
      isSaved=false;
    }

    return SaveButton(isSaved: isSaved, postId: post.postsIndex , profilesId: post.id);
  }


  @override
  Future<SaveButton> getSaveButton(Posts post, bool isSaved) async {
    bool saved;

    if(isSaved==false){
      UsersData.usersSavedPosts.add(post);
      saved=true;
    }
    else {
      UsersData.usersSavedPosts.remove(post);
      saved=false;
    }

    return SaveButton(isSaved: saved, postId: post.postsIndex , profilesId: post.id);
  }

}