part of 'follow_cubit.dart';

abstract class FollowState extends Equatable {
  const FollowState();

  @override
  List<Object> get props => [];
}
class FollowInitial extends FollowState {

  @override
  List<Object> get props => [];
}

class FollowButtonInitial extends FollowState {
  final Follow followEntity;

  const FollowButtonInitial({required this.followEntity});
  
  @override
  List<Object> get props => [followEntity];
}


