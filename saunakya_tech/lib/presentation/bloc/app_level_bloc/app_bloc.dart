import 'package:bloc/bloc.dart';
import 'app_event.dart';
import 'app_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(ApplicationState()) {
    on<TriggerAppEvent>(
      (event, emit) {
        emit(ApplicationState(index: event.index));
      },
    );
  }
}
