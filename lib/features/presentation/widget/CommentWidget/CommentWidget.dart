// ignore_for_file: file_names

import 'package:clean_project/features/domain/entities/Post/Post.dart';
import 'package:clean_project/features/domain/entities/UserComment/UserComment.dart';
import 'package:clean_project/features/presentation/cubit/UserCommentCubit/user_comment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentWidget extends StatefulWidget {
  Posts post;

  CommentWidget({required this.post});

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  late List<UserComment> commentsList;
  final controller = TextEditingController();

  Future<void> initcommentlist() async {
    await BlocProvider.of<UserCommentCubit>(context).initCommentList(widget.post);
  }

  Future<void> updatecommentlist(String? value) async {
    await BlocProvider.of<UserCommentCubit>(context).updatedCommentlist(widget.post, value);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    //With GestureDetector we dismiss the keyboard every time we click outside of it.
    return GestureDetector(
        onTap: () {
          return FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              elevation: 1,
              shadowColor: Colors.white,
              centerTitle: true,
              title: Text(
                'Comments',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            body: BlocBuilder<UserCommentCubit, UserCommentState>(
              builder: (context, state) {
                if(state is StartingCommentList){
                  commentsList= state.userComment;
                  return _buildBody();
                }
                else if (state is UpdatedCommentList){
                  commentsList= state.userComment;
                  return _buildBody();
                }
                else if(state is UserCommentWaiting){
                  return CircularProgressIndicator();
                }
                else {
                  return Text('Exception');
                }
              },
            )));
  }

  Widget _buildBody() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: commentsList.length,
            //With the following command we dismiss the keyboard every time we scroll.
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemBuilder: (context, index) => ListTile(
              title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.5),
                child: Text(
                  '@${commentsList[index].userWhoCommented}',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              subtitle: Text(
                commentsList[index].comment,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              minVerticalPadding: 12,
            ))),
        TextField(
          controller: controller,
          onSubmitted: (value) => updatecommentlist(value),
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFF48e8b3),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0.0),
              borderSide: BorderSide.none,
            ),
            hintText: 'write a comment ',
            hintStyle: TextStyle(
              color: Color(0xFF5f1da1),
            ),
            prefixIcon: Icon(
              Icons.comment_outlined,
              color: Color(0xFF5f1da1),
            ),
          ),
        ),
      ]
    );
  }

}
