
import 'package:bloc/bloc.dart';
import 'package:clean_project/features/domain/entities/FeedPageList/FeedPageList.dart';
import 'package:clean_project/features/domain/usecases/PostsUseCase/GetFeedPagePosts.dart';
import 'package:equatable/equatable.dart';

part 'feed_page_state.dart';

class FeedPageCubit extends Cubit<FeedPageCubitState> {
  final GetFeedPagePosts getFeedPagePosts;

  FeedPageCubit({required this.getFeedPagePosts,}) : super(FeedPageInitial());

  Future<void> initFeedPage() async {
    final FeedPageList feedpage=await getFeedPagePosts.call();
    emit(StartingFeedPage(initFeedPagestate: feedpage));
  }

  Future<void> refreshedFeedPage() async{
    final FeedPageList feedpage= await getFeedPagePosts.call();
    emit(RefreshedFeedPage(initFeedPagestate: feedpage));
  }

}
