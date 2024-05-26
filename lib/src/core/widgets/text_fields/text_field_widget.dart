import 'package:clario_test/src/core/utils/text_field_status.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    required this.label,
    required this.onChanged,
    this.textInputType = TextInputType.name,
    this.textInputAction = TextInputAction.done,
    this.isPassword = false,
    this.errorText = '',
    this.initialValue,
    this.textFieldStatus = TextFieldStatus.initial,
    super.key,
  });
  final String label;
  final void Function(String value) onChanged;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final String errorText;
  final bool isPassword;
  final String? initialValue;
  final TextFieldStatus? textFieldStatus;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _passwordVisible = true;

  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: widget.initialValue);
    if (widget.isPassword) _passwordVisible = false;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant TextFieldWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue == null) return;
    if (controller.text != oldWidget.initialValue) {
      controller.text = widget.initialValue ?? '';
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    Color getColorByStatus(TextFieldStatus? status) {
      if (status == null) return Colors.black;
      return switch (status) {
        TextFieldStatus.initial => Colors.black,
        TextFieldStatus.success => Colors.green,
        TextFieldStatus.failure => theme.colorScheme.onError
      };
    }

    final border = OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: getColorByStatus(widget.textFieldStatus)),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          style: TextStyle(
            color: getColorByStatus(widget.textFieldStatus),
          ),
          keyboardType: widget.isPassword
              ? TextInputType.visiblePassword
              : widget.textInputType,
          obscureText: !_passwordVisible,
          onChanged: widget.onChanged,
          textInputAction: widget.textInputAction,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            focusedBorder: border,
            disabledBorder: border,
            enabledBorder: border,
            border: border,
            errorBorder: border,
            focusedErrorBorder: border,
            error: widget.errorText == ''
                ? null
                : Text(
                    widget.errorText,
                    style: TextStyle(color: theme.colorScheme.onError),
                  ),
            filled: true,
            fillColor: Colors.white,
            hintText: widget.label,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      _passwordVisible = !_passwordVisible;
                      setState(() {});
                    },
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
