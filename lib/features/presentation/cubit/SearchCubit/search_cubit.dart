import 'package:bloc/bloc.dart';
import 'package:clean_project/features/domain/entities/ArtistProfile/ArtistProfile.dart';
import 'package:clean_project/features/domain/usecases/GetArtistProfilesUseCase/GetArtistProfile.dart';
import 'package:clean_project/features/domain/usecases/GetArtistProfilesUseCase/GetArtistProfilesInitList.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final GetArtistProfileUseCase  getArtistProfileUseCase;
  final GetArtistProfilesInitListUseCase getArtistProfilesInitListUseCase;
  
  SearchCubit({ required this.getArtistProfilesInitListUseCase,required this.getArtistProfileUseCase,}) : super(SearchInitial());


  Future<void> getSearchList (String query) async {
    final List<ArtistProfile> searchList = await getArtistProfileUseCase.call(query);
    emit(SearchLoaded(searchList: searchList));
  }

  Future<void> geInitList () async {
    final List<ArtistProfile> initList = await getArtistProfilesInitListUseCase.call();
    emit(SearchWaiting(initList: initList));
  }
}