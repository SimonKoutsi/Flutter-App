import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:clean_project/features/domain/entities/Post/Post.dart';
import 'package:clean_project/features/domain/usecases/PostsUseCase/GetLikedPosts.dart';
import 'package:equatable/equatable.dart';

part 'liked_posts_page_state.dart';

class LikedPostsPageCubit extends Cubit<LikedPostsPageState> {
  final GetLikedPosts getLikedPosts;

  LikedPostsPageCubit({required this.getLikedPosts}) : super(LikedPostsPageInitial());

  Future<void> getLikedPostsList () async {
    emit(LikedPostsPageLoading());
    final LinkedHashSet<Posts> list = await getLikedPosts.call();
    emit(MainLikedPostsPage(likedposts: list));
  }
}
