abstract class CountdownState {}

class CountdownIdle extends CountdownState {}

class CountdownRunning extends CountdownState {
  final Duration duration;

  CountdownRunning(this.duration);
}
