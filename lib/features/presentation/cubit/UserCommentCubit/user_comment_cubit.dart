
import 'package:bloc/bloc.dart';
import 'package:clean_project/features/domain/entities/Post/Post.dart';
import 'package:clean_project/features/domain/entities/UserComment/UserComment.dart';
import 'package:clean_project/features/domain/usecases/UserCommentUseCase/GetInitUserCommentListUseCase.dart';
import 'package:clean_project/features/domain/usecases/UserCommentUseCase/GetUserCommentListUseCase.dart';
import 'package:equatable/equatable.dart';

part 'user_comment_state.dart';

class UserCommentCubit extends Cubit<UserCommentState> {
  final GetInitUserCommentList getInitUserCommentList;
  final GetUserCommentList getUserCommentList;

  UserCommentCubit({required this.getInitUserCommentList, required this.getUserCommentList}) : super(UserCommentInitial());

  Future<void> initCommentList(Posts post) async{
    final List<UserComment> commentlist= await getInitUserCommentList.call(post);
    emit(StartingCommentList(userComment: commentlist));
  }
  Future<void> updatedCommentlist(Posts post, String? newComment ) async{
    emit(UserCommentWaiting());
    final List<UserComment> commentlist= await getUserCommentList.call(post, newComment);
    emit(UpdatedCommentList(userComment: commentlist));
  }
}
