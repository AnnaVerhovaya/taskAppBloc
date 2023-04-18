part of 'swich_bloc.dart';

abstract class SwichEvent extends Equatable {
  const SwichEvent();

  @override
  List<Object> get props => [];
}
class SwichOnEvent extends SwichEvent{}
class SwichOffEvent extends SwichEvent{}