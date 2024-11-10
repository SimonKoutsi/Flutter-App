// ignore_for_file: file_names

import 'package:clean_project/features/domain/entities/Post/Post.dart';
import 'package:clean_project/features/presentation/cubit/LikeButtonCubit/like_button_cubit.dart';
import 'package:clean_project/features/presentation/cubit/SaveButtonCubit/save_button_cubit.dart';
import 'package:clean_project/features/presentation/cubit/UserCommentCubit/user_comment_cubit.dart';
import 'package:clean_project/features/presentation/widget/CommentWidget/CommentWidget.dart';
import 'package:clean_project/features/presentation/widget/LikeButton/LikeButtonWidget.dart';
import 'package:clean_project/features/presentation/widget/SaveButton/SaveButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_project/injection_container.dart' as di;

class PostWidget extends StatelessWidget {
  //These 2 keys allow us to have access in the states of the "LikeButton" and "SaveButton".
  //By using these keys every time a PostWidget is build, the right icons and likes number are
  //being displayed.
  final keyLikeButton = GlobalKey<LikeButtonWidgetState>();
  final keySaveButton = GlobalKey<SaveButtonWidgetState>();
  final Posts postData;

  PostWidget({Key? key, required this.postData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          //We call the initLikeButton method before we call the LikeButton widget to make sure that the like button field will be
          //initialized correctly
          create: (context) => di.sl<LikeButtonCubit>()..initLikeButton(postData),
        ),
        BlocProvider(
          create: (context) => di.sl<SaveButtonCubit>(),
        ),
      ],
      child: Padding(
          padding: EdgeInsets.all(2.0),
          child: Center(
            child: Container(
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      postData.artistProfileName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    leading: Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: postData.artistsProfilePhoto,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                      //onDoubleTap: 'na kanei like',
                      child: Container(
                    height: 460,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: postData.PhotoOfPost,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
                  SizedBox(
                    height: 6.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                          //Like Button
                          child: LikeButtonWidget(
                        key: keyLikeButton,
                        post: postData,
                      )),
                      Expanded(
                        child: Container(
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => BlocProvider(
                                        create: (context) => di.sl<UserCommentCubit>()..initCommentList(postData),
                                        child: CommentWidget(
                                          post: postData,
                                        ),
                                      )));
                            },
                            icon: Icon(
                              Icons.comment_outlined,
                              size: 28,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          //Save Button
                          child: SaveButtonWidget(
                              key: keySaveButton, post: postData),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
