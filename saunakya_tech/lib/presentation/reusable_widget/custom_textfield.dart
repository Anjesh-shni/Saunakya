import 'package:flutter/material.dart';
import '../../utils/constant/colors.dart';
import 'small_text.dart';

class TextFormFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hinText;
  final TextInputType textInputType;
  final void Function(String value)? onChanged;
  final String titleText;
  const TextFormFieldInput({
    super.key,
    required this.textEditingController,
    required this.hinText,
    required this.textInputType,
    required this.onChanged,
    required this.titleText,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 2, bottom: 5),
          child: SmallText(
            text: titleText,
            size: 15,
            color: primaryColor,
          ),
        ),
        // const SizedBox(
        //   height: 5,
        // ),
        TextField(
          onChanged: (value) => onChanged!(value),
          controller: textEditingController,
          decoration: InputDecoration(
            hintText: hinText,
            border: inputBorder,
            focusedBorder: inputBorder,
            enabledBorder: inputBorder,
            filled: true,
            contentPadding: const EdgeInsets.all(8.0),
          ),
          keyboardType: textInputType,
        ),
      ],
    );
  }
}
