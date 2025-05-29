import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'my_dhan_event.dart';
part 'my_dhan_state.dart';

class MyDhanBloc extends Bloc<MyDhanEvent, MyDhanState> {
  MyDhanBloc() : super(MyDhanInitial()) {
    on<MyDhanEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
