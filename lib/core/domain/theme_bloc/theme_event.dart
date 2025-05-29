part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();
}
class ThemeChanged extends ThemeEvent {
  final ThemeData theme;

  const ThemeChanged({required this.theme});

  @override
  List<Object?> get props => [theme];
}

class InitialTheme extends ThemeEvent{
  final BuildContext context;
  const InitialTheme({required this.context});
  @override
  List<Object> get props => [context];
}
