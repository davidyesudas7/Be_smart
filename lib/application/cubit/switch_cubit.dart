import 'package:flutter_bloc/flutter_bloc.dart';

enum SwitchState { on, off }

class SwitchesCubit extends Cubit<List<SwitchState>> {
  SwitchesCubit(int count)
      : super(List<SwitchState>.generate(count, (_) => SwitchState.off));

  void toggleSwitch(int index) {
    final List<SwitchState> currentState = List.from(state);
    currentState[index] = currentState[index] == SwitchState.on
        ? SwitchState.off
        : SwitchState.on;
    emit(currentState);
  }
}
