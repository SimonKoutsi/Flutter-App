part of 'edit_user_profile_cubit.dart';

abstract class EditUserProfileState extends Equatable {
  const EditUserProfileState();

  @override
  List<Object> get props => [];
}

class EditUserProfileInitial extends EditUserProfileState {
  EditUserProfileInitial();
}

class EditUserProfileUpdated extends EditUserProfileState {
  final bool updated;

  const EditUserProfileUpdated({required this.updated});

  @override
  List<Object> get props => [updated];  
}

class WaitingEditUserProfile extends EditUserProfileState {
  final UserProfile initCredentials;

  const WaitingEditUserProfile({required this.initCredentials});

  @override
  List<Object> get props => [initCredentials];
}

