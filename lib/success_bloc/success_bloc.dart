import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'success_event.dart';
part 'success_state.dart';

class SuccessBloc extends Bloc<SuccessEvent, SuccessState> {
  SuccessBloc() : super(SuccessInitial()) {
    on<SuccessEvent>((event, emit) {
      if (event is NavBack) {
        emit(SuccessNav());
      }
    });
  }
}
