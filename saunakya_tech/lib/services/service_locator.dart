
// // I can use Get_it package for dependency injection by initializing get it instance

// import 'package:get_it/get_it.dart';

// GetIt locator = GetIt.instance;

// Future<void> init() async {
//   final http.Client httpClient = http.Client();
//   locator.registerLazySingleton<http.Client>(() => httpClient);
//   chatInjectionContainer();
// }

// Future<void> dependencyInjection() async {
//   //cubit
//   locator.registerFactory<>(
//     () => ),
//   );

//   //useCase
//   locator.registerLazySingleton<>(
//     () =>),
//   );

//   //Repository
//   locator.registerLazySingleton<>(
//     () =>),
//   );

//   //remote data source
//   locator.registerLazySingleton<>(
//     () =>),
//   );
// }
