part of 'users_following_page_cubit.dart';

abstract class UsersFollowingPageState extends Equatable {
  const UsersFollowingPageState();

  @override
  List<Object> get props => [];
}

class UsersFollowingPageInitial extends UsersFollowingPageState {
  UsersFollowingPageInitial();
}

class UsersFollowingPage extends UsersFollowingPageState {
  final List<ArtistProfile> followinglist;

  const UsersFollowingPage({required this.followinglist});

  @override
  List<Object> get props => [followinglist];
}

class UsersFollowingPageLoading extends UsersFollowingPageState {
  const UsersFollowingPageLoading();
}