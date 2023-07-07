import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saunakya_tech/presentation/reusable_widget/big_text.dart';
import 'package:saunakya_tech/presentation/reusable_widget/small_text.dart';
import 'package:saunakya_tech/utils/constant/colors.dart';
import '../../bloc/user_bloc/user_bloc.dart';
import '../../bloc/user_bloc/user_state.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SmallText(
          text: "User List",
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.red,
            ));
          } else if (state is UserLoaded) {
            final users = state.users;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: blac, width: 0.5),
                      color: Colors.grey),
                  padding: const EdgeInsets.all(8),
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: "ID:- ${user.id}", color: blac),
                      BigText(text: "userName:- ${user.username}", color: blac),
                      SmallText(text: "Name:- ${user.name}", color: blac),
                      SmallText(text: "Email:- ${user.email}", color: blac),
                      SmallText(text: "Phone:- ${user.phone}", color: blac),
                      SmallText(
                          text: "Address:- ${user.streetAddress}", color: blac),
                      SmallText(text: "Website:- ${user.website}", color: blac),
                    ],
                  ),
                );
              },
            );
          } else if (state is UserError) {
            return Center(child: Text(state.message));
          } else {
            return  Center(child: SmallText(text: 'Something went wrong',color: blac,));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          context.read<UserBloc>().fetchUserProfiles();
        },
        child: const Icon(
          Icons.refresh,
          color: blac,
        ),
      ),
    );
  }
}
