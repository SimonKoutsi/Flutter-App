
// ignore_for_file: file_names

import 'package:clean_project/features/domain/entities/Post/Post.dart';
import 'package:clean_project/features/domain/entities/SaveButton/SaveButton.dart';

abstract class SaveButtonRepository {
  Future<SaveButton> getInitSaveButton(Posts post);
  Future<SaveButton> getSaveButton(Posts post, bool isSaved);
}