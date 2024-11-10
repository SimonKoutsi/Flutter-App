import 'package:bloc/bloc.dart';
import 'package:clean_project/features/domain/entities/UserProfile/UserProfile.dart';
import 'package:clean_project/features/domain/usecases/UserProfileUseCase/GetInitUserProfile.dart';
import 'package:clean_project/features/domain/usecases/UserProfileUseCase/UpdateUserProfile.dart';
import 'package:equatable/equatable.dart';

part 'edit_user_profile_state.dart';

class EditUserProfileCubit extends Cubit<EditUserProfileState> {
  final UpdateUserProfile updateUserProfile;
  final GetInitUserProfile getInitUserProfile;
  EditUserProfileCubit({required this.updateUserProfile, required this.getInitUserProfile}) : super(EditUserProfileInitial());

  Future<void> userProfileUpdate(UserProfile userProfile) async {
    final bool updated= await updateUserProfile.call(userProfile);
    emit(EditUserProfileUpdated(updated: updated));
  
  }

  Future<void> getInitProfileCredential() async {
    final UserProfile initCredentials= await getInitUserProfile.call();
    emit(WaitingEditUserProfile(initCredentials: initCredentials));
  }
}
