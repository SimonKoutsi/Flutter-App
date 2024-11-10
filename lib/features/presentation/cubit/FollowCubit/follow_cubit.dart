import 'package:bloc/bloc.dart';
import 'package:clean_project/features/domain/entities/ArtistProfile/ArtistProfile.dart';
import 'package:clean_project/features/domain/entities/Follow/Follow.dart';
import 'package:clean_project/features/domain/usecases/FollowUseCase/FollowInit.dart';
import 'package:clean_project/features/domain/usecases/FollowUseCase/FollowButtonAction.dart';
import 'package:equatable/equatable.dart';

part 'follow_state.dart';

class FollowCubit extends Cubit<FollowState> {
  final FollowInitUseCase followInitUseCase;
  final FollowButtonActiongUseCase followButtonActiongUseCase;

  FollowCubit({
    required this.followInitUseCase, 
    required this.followButtonActiongUseCase}) 
  : super(FollowInitial());

  Future<void> initFollow(ArtistProfile artistProfile) async {
    final Follow initfollow= await followInitUseCase.call(artistProfile);
    emit(FollowButtonInitial(followEntity: initfollow));
  }

  Future<void> followAction (ArtistProfile artistProfile, bool isfollowing) async {
    final Follow followaction= await followButtonActiongUseCase.call(artistProfile, isfollowing);
    emit(FollowButtonInitial(followEntity: followaction));
  }
}
