part of 'explore_bloc.dart';

sealed class ExploreState extends Equatable {
  const ExploreState();
}

final class ExploreInitial extends ExploreState {
  @override
  List<Object> get props => [];
}
