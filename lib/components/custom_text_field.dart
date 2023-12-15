import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
        required this.label,
        this.controller,
        this.initial,
        this.keyboard = TextInputType.text,
        this.readOnly = false,
        this.onTap,
        this.onChanged,
        this.format,
        this.expands = false,
        this.maxLength = -1,
      });

  final String label;
  final TextEditingController? controller;
  final String? initial;
  final TextInputType keyboard;
  final bool readOnly;
  final VoidCallback? onTap;
  final void Function(String?)? onChanged;
  final List<TextInputFormatter>? format;
  final bool expands;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      expands: expands,
      maxLines: expands ? null : 1,
      controller: controller,
      initialValue: initial,
      readOnly: readOnly,
      keyboardType: keyboard,
      onChanged: onChanged,
      textAlignVertical: TextAlignVertical.top,
      style: Theme.of(context).textTheme.bodyMedium,
      maxLength: maxLength,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: Theme.of(context).textTheme.titleMedium,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Theme.of(context).primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Theme.of(context).primaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      inputFormatters: format,
      onTap: () {
        onTap;
      },
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}