part of 'feed_page_cubit.dart';

abstract class FeedPageCubitState extends Equatable {
  const FeedPageCubitState();

  @override
  List<Object> get props => [];
}

class FeedPageInitial extends FeedPageCubitState {
  const FeedPageInitial();

  @override
  List<Object> get props => [];
}

class StartingFeedPage extends FeedPageCubitState {
  final FeedPageList initFeedPagestate;

  const StartingFeedPage({required this.initFeedPagestate});
  
  @override
  List<Object> get props => [initFeedPagestate];
}

class RefreshedFeedPage extends FeedPageCubitState {
  final FeedPageList initFeedPagestate;

  const RefreshedFeedPage({required this.initFeedPagestate});
  
  @override
  List<Object> get props => [initFeedPagestate];
}
