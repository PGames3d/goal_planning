/*
 * Copyright (c) 2025. BeyondSouls. All rights reserved.
 * Author: Parshuram Pathave
 *
 */

part of 'internet_bloc.dart';

sealed class InternetState extends Equatable{}

class InternetConnected extends InternetState {
  @override
  List<Object?> get props => [];
}

class InternetDisconnected extends InternetState {
  @override
  List<Object?> get props => [];
}
class InternetLoading extends InternetState {
  @override
  List<Object?> get props => [];
}