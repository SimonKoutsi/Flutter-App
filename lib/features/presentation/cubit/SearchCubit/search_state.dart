part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {

  @override
  List<Object> get props => [];
}

class SearchWaiting extends SearchState {
  final List<ArtistProfile> initList;
  const SearchWaiting({required this.initList});

  @override
  List<Object> get props => [initList];
}

class SearchLoaded extends SearchState {
  final List<ArtistProfile> searchList;
  const SearchLoaded({ required this.searchList});

  @override
  List<Object> get props => [searchList];
}