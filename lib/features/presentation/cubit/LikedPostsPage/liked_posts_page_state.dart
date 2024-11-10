part of 'liked_posts_page_cubit.dart';

abstract class LikedPostsPageState extends Equatable {
  const LikedPostsPageState();

  @override
  List<Object> get props => [];
}

class LikedPostsPageInitial extends LikedPostsPageState {
  LikedPostsPageInitial();
}

class MainLikedPostsPage extends LikedPostsPageState {
  final LinkedHashSet<Posts> likedposts;

  const MainLikedPostsPage({required this.likedposts});

  @override
  List<Object> get props => [likedposts];
}

class LikedPostsPageLoading extends LikedPostsPageState {
  const LikedPostsPageLoading();
}