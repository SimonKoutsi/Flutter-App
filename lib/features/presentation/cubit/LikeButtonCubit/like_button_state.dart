part of 'like_button_cubit.dart';

abstract class LikeButtonState extends Equatable {
  const LikeButtonState();

  @override
  List<Object> get props => [];
}

class LikeButtonInitial extends LikeButtonState {
  const LikeButtonInitial();
}

class StartingLikeButton extends LikeButtonState {
  final LikeButton likeButton;
  const StartingLikeButton({required this.likeButton });

  @override
  List<Object> get props => [likeButton];
}

class OnTapLikeButton extends LikeButtonState {
  final LikeButton likeButton;
  const OnTapLikeButton({required this.likeButton });

  @override
  List<Object> get props => [likeButton];
}