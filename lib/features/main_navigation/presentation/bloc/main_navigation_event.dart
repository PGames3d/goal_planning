part of 'main_navigation_bloc.dart';

sealed class MainNavigationEvent extends Equatable {
  const MainNavigationEvent();
}

final class InitialEvent extends MainNavigationEvent{
  @override
  List<Object?> get props => [];
}

final class BottomNavigationEvent extends MainNavigationEvent {
  final int index;
  const BottomNavigationEvent(this.index);

  @override
  List<Object?> get props => [index];
}
