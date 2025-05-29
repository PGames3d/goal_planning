part of 'my_dhan_bloc.dart';

sealed class MyDhanState extends Equatable {
  const MyDhanState();
}

final class MyDhanInitial extends MyDhanState {
  @override
  List<Object> get props => [];
}
