
part of 'swich_bloc.dart';

class SwichState extends Equatable {
  final bool switchValue;
  const SwichState({
  required this.switchValue,}
  );

  @override
  List<Object> get props => [switchValue];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'switchValue': switchValue});
  
    return result;
  }

  factory SwichState.fromMap(Map<String, dynamic> map) {
    return SwichState(
      switchValue: map['switchValue'] ?? false,
    );
  }

}

class SwichInitial extends SwichState {
  const SwichInitial({required super.switchValue});
}
