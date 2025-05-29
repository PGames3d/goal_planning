/*
 * Copyright (c) 2025. BeyondSouls. All rights reserved.
 * Author: Parshuram Pathave
 *
 */

import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
part  'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  late StreamSubscription<InternetStatus> _internetSubscription;

  InternetBloc() : super(InternetConnected()) {
    _internetSubscription = InternetConnection().onStatusChange.listen((status) {
      add(InternetStatusChanged(status == InternetStatus.connected));
    });

    on<InternetStatusChanged>((event, emit) {
      emit(InternetLoading());
      if (event.isConnected) {
        emit(InternetConnected());
      } else {
        emit(InternetDisconnected());
      }
    });
  }

  @override
  Future<void> close() {
    _internetSubscription.cancel();
    return super.close();
  }
}
