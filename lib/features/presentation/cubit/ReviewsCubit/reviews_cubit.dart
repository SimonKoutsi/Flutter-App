import 'package:bloc/bloc.dart';
import 'package:clean_project/features/domain/entities/UserComment/UserComment.dart';
import 'package:clean_project/features/domain/usecases/ReviewsUseCase/GetInitReviewsListUseCase.dart';
import 'package:clean_project/features/domain/usecases/ReviewsUseCase/GetReviewsListUseCase.dart';
import 'package:equatable/equatable.dart';

part 'reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  final GetInitReviewsList getInitReviewsList;
  final GetReviewsList getReviewsList;

  ReviewsCubit({required this.getInitReviewsList, required this.getReviewsList}) : super(ReviewsInitial());

  Future<void> initReviewList(int artistProfileId) async{
    final List<UserComment> reviewlist= await getInitReviewsList.call(artistProfileId);
    emit(StartingReviewsList(review: reviewlist));
  }
  Future<void> updatedReviewlist(int artistProfileId, String? newReview ) async{
    emit(ReviewsListWaiting());
    final List<UserComment> reviewlist= await getReviewsList.call(artistProfileId, newReview);
    emit(UpdatedReviewList(review: reviewlist));
  }
}
