import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thaicancerfree/constants.dart';

class AppTextForm extends StatefulWidget {
  AppTextForm({
    Key? key,
    this.decoration,
    this.keyboardType,
    this.controller,
    this.labelStyle,
    this.labelText,
    this.hintText,
    this.validator,
    this.onChanged,
    this.isPassword = false,
    this.enabled = true,
    this.maxline,
    this.maxLength,
    this.obscureText,
    this.onFieldSubmitted,
    this.focusNode,
    this.inputFormatters
  }) : super(key: key);

  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final TextStyle? labelStyle;
  final String? labelText;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final void Function(String)? onChanged;
  final bool isPassword;
  final bool enabled;

  final dynamic obscureText;
  int? maxline;
  int? maxLength;
  Function(String)? onFieldSubmitted;
  FocusNode? focusNode;
  List<TextInputFormatter>? inputFormatters;

  @override
  State<AppTextForm> createState() => _AppTextFormState();
}

class _AppTextFormState extends State<AppTextForm> {
  late bool _show = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        // side: BorderSide(
        //   color: Colors.grey,
        // ),
        borderRadius: BorderRadius.circular(10.0), //<-- SEE HERE
      ),
      child: TextFormField(
        obscureText: widget.isPassword ? _show : false,
        controller: widget.controller,
        enabled: widget.enabled,
        keyboardType: widget.keyboardType,
        maxLines: widget.maxline ?? 1,
        cursorColor: kBackgroundColor,
        style: TextStyle(fontSize: isPhone(context) ? 22 : 32),
        focusNode: widget.focusNode,
        inputFormatters: widget.inputFormatters,
        decoration: InputDecoration(
          errorStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: isPhone(context) ? 16 : 26),
          contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          fillColor: kBackgroundColor,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: widget.labelText,
          labelStyle: widget.labelStyle,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: kSecondTextColor, fontSize: isPhone(context) ? 20 : 30),
          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _show = !_show;
                    });
                  },
                  child: _show ? Image.asset('assets/icons/eye.png') : Image.asset('assets/icons/eye-slash.png'),
                )
              : null,
        ),
        validator: widget.validator,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onFieldSubmitted,
      ),
    );
  }
}
