part of 'reviews_cubit.dart';

abstract class ReviewsState extends Equatable {
  const ReviewsState();

  @override
  List<Object> get props => [];
}

class ReviewsInitial extends ReviewsState {
  const ReviewsInitial();
}

class StartingReviewsList extends ReviewsState {
  final List<UserComment> review;
  const StartingReviewsList({required this.review });

  @override
  List<Object> get props => [review];
}

class UpdatedReviewList extends ReviewsState {
  final List<UserComment> review;
  const UpdatedReviewList({required this.review });

  @override
  List<Object> get props => [review];
}

class ReviewsListWaiting extends ReviewsState {
  const ReviewsListWaiting();
}