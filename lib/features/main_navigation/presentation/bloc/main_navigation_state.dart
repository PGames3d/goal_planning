part of 'main_navigation_bloc.dart';

sealed class MainNavigationState extends Equatable {
  const MainNavigationState();
}
final class HomeInitialState extends MainNavigationState {

  @override
  List<Object?> get props => [];

}
final class HomeLoadingState extends MainNavigationState {
  @override
  List<Object?> get props => [];
}
final class BottomNavigationState extends MainNavigationState {
  final int index;
  const BottomNavigationState({required this.index,});
  @override
  List<Object?> get props => [index];
}