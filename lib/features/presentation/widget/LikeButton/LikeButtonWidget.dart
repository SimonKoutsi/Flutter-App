// ignore_for_file: file_names

import 'package:clean_project/features/domain/entities/LikeButton/LikeButton.dart';
import 'package:clean_project/features/domain/entities/Post/Post.dart';
import 'package:clean_project/features/presentation/cubit/LikeButtonCubit/like_button_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LikeButtonWidget extends StatefulWidget {
  final Posts post;

  const LikeButtonWidget({Key? key, required this.post}) : super(key: key);

  @override
  State<LikeButtonWidget> createState() => LikeButtonWidgetState();
}

class LikeButtonWidgetState extends State<LikeButtonWidget> {
  late LikeButton likeButton= LikeButton(isLiked: false, likesNumber: '', postId: null, profilesId: null);

  @override
  void initState() {
    super.initState();
    initLikeButton();

  }

  Future<void> initLikeButton() async {
    await BlocProvider.of<LikeButtonCubit>(context).initLikeButton(widget.post);
  }

  Future<void> onTapLikeButton() async {
    await BlocProvider.of<LikeButtonCubit>(context).onTapLikeButton(widget.post, likeButton.isLiked);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LikeButtonCubit, LikeButtonState>(
      builder: (context, state) {
        if(state is StartingLikeButton){
          if( state.likeButton.postId== widget.post.postsIndex && state.likeButton.profilesId== widget.post.id){
            likeButton= state.likeButton;
          }
          return _buildRow();
        }
        else if(state is OnTapLikeButton){
          if( state.likeButton.postId== widget.post.postsIndex && state.likeButton.profilesId== widget.post.id){
            likeButton= state.likeButton;
          }
          return _buildRow();
        }
        else{
          return Text('Exception');
        }
      },
    );
  }

  Widget _buildRow() {
    return Row(
      children: [
        Expanded(
          child: IconButton(
              onPressed: onTapLikeButton,
              icon: likeButton.isLiked == false
                  ? Icon(
                      Icons.favorite_border_outlined,
                      size: 28,
                      color: Colors.white,
                    )
                  : Icon(
                      Icons.favorite,
                      size: 28,
                      color: Colors.white,
                    )),
        ),
        Expanded(
          child: Text('${likeButton.likesNumber}',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
        )
      ]
    );
  }
}
