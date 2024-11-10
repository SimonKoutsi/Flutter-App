import 'package:bloc/bloc.dart';
import 'package:clean_project/features/domain/entities/ArtistProfile/ArtistProfile.dart';
import 'package:clean_project/features/domain/usecases/GetUsersFollowingListUseCase/GetUsersFollowingList.dart';
import 'package:equatable/equatable.dart';

part 'users_following_page_state.dart';

class UsersFollowingPageCubit extends Cubit<UsersFollowingPageState> {
  final GetUsersFollowingListUseCase getUsersFollowingListUseCase;

  UsersFollowingPageCubit({required this.getUsersFollowingListUseCase}) : super(UsersFollowingPageInitial());

  Future<void> getUsersFollowinList () async {
    emit(UsersFollowingPageLoading());
    final List<ArtistProfile> initList = await getUsersFollowingListUseCase.call();
    emit(UsersFollowingPage(followinglist: initList));
  }
}
