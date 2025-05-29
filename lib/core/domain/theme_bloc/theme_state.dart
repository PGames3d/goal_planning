part of 'theme_bloc.dart';

sealed class ThemeState extends Equatable {
  const ThemeState();
}

final class ThemeInitial extends ThemeState {
  @override
  List<Object> get props => [];
}

class ThemeLoaded extends ThemeState {
  final ThemeData theme;

  const ThemeLoaded(this.theme);

  @override
  List<Object?> get props => [ThemeData];
}