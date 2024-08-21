import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:stylish/injection_container.dart';

class BlocObserverService extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    InjectionContainer.getIt<Logger>().f(
      'Call `onCreate` Bloc: `${bloc.runtimeType}` |BlocObserverService|',
    );
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    InjectionContainer.getIt<Logger>().f(
      'Call `onChange` Bloc: `${bloc.runtimeType}` change: `$change` |BlocObserverService|',
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    InjectionContainer.getIt<Logger>().f(
      'Call `onError` Bloc: `${bloc.runtimeType}` error: `$error` |BlocObserverService|',
    );
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    InjectionContainer.getIt<Logger>().f(
      'Call `onClose` Bloc: `${bloc.runtimeType}` |BlocObserverService|',
    );
  }
}
