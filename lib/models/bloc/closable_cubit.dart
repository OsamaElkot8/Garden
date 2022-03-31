import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ClosableCubit<S> extends Cubit<S> {
  var closed = false;
  ClosableCubit(S initialState) : super(initialState);

  @override
  @mustCallSuper
  Future<void> close() {
    closed = true;
    return super.close();
  }
}
