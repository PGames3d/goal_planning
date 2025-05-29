/*
 * Copyright (c) 2025. BeyondSouls. All rights reserved.
 * Author: Parshuram Pathave
 *
 */

part of 'internet_bloc.dart';

sealed class InternetEvent {}
class InternetStatusChanged extends InternetEvent {
  final bool isConnected;
  InternetStatusChanged(this.isConnected);

  List<Object> get props => [isConnected];
}