part of 'save_button_cubit.dart';

abstract class SaveButtonState extends Equatable {
  const SaveButtonState();

  @override
  List<Object> get props => [];
}

class SaveButtonInitial extends SaveButtonState {
  const SaveButtonInitial();
}

class StartingSaveButton extends SaveButtonState {
  final SaveButton saveButton;
  const StartingSaveButton({required this.saveButton });

  @override
  List<Object> get props => [saveButton];
}

class OnTapSaveButton extends SaveButtonState {
  final SaveButton saveButton;
  const OnTapSaveButton({required this.saveButton });

  @override
  List<Object> get props => [saveButton];
}