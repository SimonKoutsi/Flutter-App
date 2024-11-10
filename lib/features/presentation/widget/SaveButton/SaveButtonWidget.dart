//ignore_for_file: file_names

import 'package:clean_project/features/domain/entities/Post/Post.dart';
import 'package:clean_project/features/domain/entities/SaveButton/SaveButton.dart';
import 'package:clean_project/features/presentation/cubit/SaveButtonCubit/save_button_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveButtonWidget extends StatefulWidget {
  final Posts post;

  const SaveButtonWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  State<SaveButtonWidget> createState() => SaveButtonWidgetState();
}

class SaveButtonWidgetState extends State<SaveButtonWidget> {
  late SaveButton saveButton= SaveButton(isSaved: false, postId: '', profilesId: '');

  @override
  void initState() {
    initSaveButton();

    super.initState();
  }

  Future<void> initSaveButton() async {
    await BlocProvider.of<SaveButtonCubit>(context).initSaveButton(widget.post);
  }

  Future<void> onTapSaveButton() async {
    await BlocProvider.of<SaveButtonCubit>(context).onTapSaveButton(widget.post, saveButton.isSaved);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SaveButtonCubit, SaveButtonState>(
      builder: (context, state) {
        if(state is StartingSaveButton){
          if( state.saveButton.postId== widget.post.postsIndex && state.saveButton.profilesId== widget.post.id){
            saveButton= state.saveButton;
          }
          return buildSaveButton();
        }
        else if (state is OnTapSaveButton){
          if( state.saveButton.postId== widget.post.postsIndex && state.saveButton.profilesId== widget.post.id){
            saveButton= state.saveButton;
          }
          return buildSaveButton();
        }
        else{
          return Text('Exception');
        }
      }
    );
  }

  Widget buildSaveButton(){
    return IconButton(
      onPressed: onTapSaveButton,
      icon: saveButton.isSaved == false
      ? Icon(
          Icons.bookmark_outline,
          size: 28,
          color: Colors.white,
        )
      : Icon(
          Icons.bookmark,
          size: 28,
          color: Colors.white,
        )
    );
  }
  
}


