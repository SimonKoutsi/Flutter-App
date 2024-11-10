import 'package:bloc/bloc.dart';
import 'package:clean_project/features/domain/entities/LikeButton/LikeButton.dart';
import 'package:clean_project/features/domain/entities/Post/Post.dart';
import 'package:clean_project/features/domain/usecases/LikeButtonUseCase/GetInitLikeButton.dart';
import 'package:clean_project/features/domain/usecases/LikeButtonUseCase/GetLikeButton.dart';
import 'package:equatable/equatable.dart';

part 'like_button_state.dart';

class LikeButtonCubit extends Cubit<LikeButtonState> {
  final GetInitLikeButton getInitLikeButton;
  final GetLikeButton getLikeButton;

  LikeButtonCubit({required this.getInitLikeButton, required this.getLikeButton}) : super(LikeButtonInitial());

  Future<void> initLikeButton(Posts post) async{
    final LikeButton likeButton= await getInitLikeButton.call(post);
    emit(StartingLikeButton(likeButton: likeButton));
  }
  Future<void> onTapLikeButton(Posts post, bool isLiked) async{
    final LikeButton likeButton= await getLikeButton.call(post, isLiked);
    emit(OnTapLikeButton(likeButton: likeButton));
  }
}