import 'package:bloc/bloc.dart';
import 'package:clean_project/features/domain/entities/Post/Post.dart';
import 'package:clean_project/features/domain/entities/SaveButton/SaveButton.dart';
import 'package:clean_project/features/domain/usecases/SaveButtonUseCase/GetInitSaveButton.dart';
import 'package:clean_project/features/domain/usecases/SaveButtonUseCase/GetSaveButton.dart';
import 'package:equatable/equatable.dart';

part 'save_button_state.dart';

class SaveButtonCubit extends Cubit<SaveButtonState> {
  final GetInitSaveButton getInitSaveButton;
  final GetSaveButton getSaveButton;

  SaveButtonCubit({required this.getInitSaveButton, required this.getSaveButton}) : super(SaveButtonInitial());

  Future<void> initSaveButton(Posts post) async{
    final SaveButton savebutton= await getInitSaveButton.call(post);
    emit(StartingSaveButton(saveButton: savebutton));
  }
  Future<void> onTapSaveButton(Posts post, bool isSaved) async{
    final SaveButton savebutton= await getSaveButton.call(post, isSaved);
    emit(OnTapSaveButton(saveButton: savebutton));
  }
}
