import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saunakya_tech/presentation/bloc/timer_bloc/timer_state.dart';

class CountdownBloc extends Cubit<CountdownState> {
  Timer? _timer;
  Duration? _duration;

  CountdownBloc() : super(CountdownIdle());

  void startCountdown(Duration duration) {
    _duration = duration;
    emit(CountdownRunning(duration));
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _duration = _duration! - const Duration(seconds: 1);
      if (_duration!.inSeconds <= 0) {
        stopCountdown();
      } else {
        emit(CountdownRunning(_duration!));
      }
    });
  }

  void stopCountdown() {
    _timer?.cancel();
    _timer = null;
    emit(CountdownIdle());
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
