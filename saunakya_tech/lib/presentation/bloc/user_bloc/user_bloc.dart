import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:saunakya_tech/presentation/bloc/user_bloc/user_state.dart';
import '../../../data/model/user_model.dart';



class UserBloc extends Cubit<UserState> {
  UserBloc() : super(UserInitial());

  Future<void> fetchUserProfiles() async {
    emit(UserLoading());
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List<dynamic>;
        final users = data.map((json) => User.fromJson(json)).toList();
        emit(UserLoaded(users));
      } else {
        emit(UserError('Failed to fetch user profiles'));
      }
    } catch (e) {
      emit(UserError('An error occurred'));
    }
  }
}
