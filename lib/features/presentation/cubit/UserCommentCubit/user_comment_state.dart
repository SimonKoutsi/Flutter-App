part of 'user_comment_cubit.dart';

abstract class UserCommentState extends Equatable {
  const UserCommentState();

  @override
  List<Object> get props => [];
}

class UserCommentInitial extends UserCommentState {
  const UserCommentInitial();
}

class StartingCommentList extends UserCommentState {
  final List<UserComment> userComment;
  const StartingCommentList({required this.userComment });

  @override
  List<Object> get props => [userComment];
}

class UpdatedCommentList extends UserCommentState {
  final List<UserComment> userComment;
  const UpdatedCommentList({required this.userComment });

  @override
  List<Object> get props => [userComment];
}

class UserCommentWaiting extends UserCommentState {
  const UserCommentWaiting();
}
