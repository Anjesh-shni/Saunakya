import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saunakya_tech/presentation/pages/timer_count/time_parse.dart';
import 'package:saunakya_tech/presentation/reusable_widget/big_text.dart';
import 'package:saunakya_tech/presentation/reusable_widget/custom_button.dart';
import 'package:saunakya_tech/presentation/reusable_widget/small_text.dart';
import 'package:saunakya_tech/utils/constant/colors.dart';
import '../../bloc/timer_bloc/timer_bloc.dart';
import '../../bloc/timer_bloc/timer_state.dart';

class CountdownScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  CountdownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SmallText(
          text: "Countdown",
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Enter time like (2h:33m:12s)',
                  labelStyle: TextStyle(color: Colors.black),
                  // border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  filled: true,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a time string';
                  }
                  final duration = parseTimeString(value);
                  if (duration == null) {
                    return 'Invalid time string';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              CustomButtonC(
                text: "Start Countdown",
                color: Colors.grey.shade800,
                height: 40,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    final timeString = _controller.text;
                    final duration = parseTimeString(timeString)!;
                    context.read<CountdownBloc>().startCountdown(duration);
                  }
                },
              ),
              const SizedBox(height: 16.0),
              BlocBuilder<CountdownBloc, CountdownState>(
                builder: (context, state) {
                  if (state is CountdownIdle) {
                    return SmallText(
                      text: 'Enter a time string and start the countdown',
                      color: blac,
                    );
                  } else if (state is CountdownRunning) {
                    final duration = state.duration;
                    final hours = duration.inHours.toString().padLeft(2, '0');
                    final minutes =
                        (duration.inMinutes % 60).toString().padLeft(2, '0');
                    final seconds =
                        (duration.inSeconds % 60).toString().padLeft(2, '0');
                    final formattedTime = '$hours:$minutes:$seconds';
                    return Center(
                        child: BigText(
                      text: 'Countdown: $formattedTime',
                      color: blac,
                    ));
                  } else {
                    return SmallText(
                      text: 'Something went wrong',
                      color: blac,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
