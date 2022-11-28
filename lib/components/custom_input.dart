import 'package:e_commerce/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends FormField<String> {
  CustomTextField({
    super.key,
    required FormFieldSetter<String> onSaved,
    FormFieldValidator<String>? validator,
    TextInputType keyboardType = TextInputType.text,
    String initialValue = "",
    required String hintText,
    bool isPassword = false,
    bool obscureText = false,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
  }) : super(
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          autovalidateMode: autovalidateMode,
          builder: (FormFieldState<String> state) {
            return Container(
              padding: const EdgeInsets.only(left: 17),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                border: Border.all(
                  color: Colors.black.withAlpha(22),
                  width: 1,
                ),
              ),
              child: TextFormField(
                obscureText: obscureText,
                keyboardType: keyboardType,
                cursorColor: accentColor,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: const TextStyle(
                    color: Color(0xFFCACACA),
                  ),
                  border: InputBorder.none,
                  suffixIcon: isPassword
                      ? IconButton(
                          onPressed: () => state.setState(
                            () => obscureText = !obscureText,
                          ),
                          icon: Icon(
                            obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: const Color(0xFFCACACA),
                          ),
                        )
                      : null,
                ),
                onChanged: (String value) => state.didChange(value),
              ),
            );
          },
        );
}
