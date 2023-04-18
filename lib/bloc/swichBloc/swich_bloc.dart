
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'swich_event.dart';
part 'swich_state.dart';

class SwichBloc extends Bloc<SwichEvent, SwichState> {
  SwichBloc() : super(const SwichInitial(switchValue: false)) {
    on<SwichOnEvent>((event, emit) {
     emit (const SwichState(switchValue: true));
    });
     on<SwichOffEvent>((event, emit) {
       emit (const SwichState(switchValue: false));
    });
  }
}
