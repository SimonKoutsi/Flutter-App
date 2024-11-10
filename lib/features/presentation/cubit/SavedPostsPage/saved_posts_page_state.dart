part of 'saved_posts_page_cubit.dart';

abstract class SavedPostsPageState extends Equatable {
  const SavedPostsPageState();

  @override
  List<Object> get props => [];
}

class SavedPostsPageInitial extends SavedPostsPageState {
  SavedPostsPageInitial();
}

class MainSavedPostsPage extends SavedPostsPageState {
  final LinkedHashSet<Posts> savedposts;

  const MainSavedPostsPage({required this.savedposts});

  @override
  List<Object> get props => [savedposts];
}

class SavedPostsPageLoading extends SavedPostsPageState {
  const SavedPostsPageLoading();
}