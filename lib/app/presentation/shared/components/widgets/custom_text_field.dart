import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:parceragem/app/presentation/shared/theme/app_colors.dart';
import 'package:parceragem/app/presentation/shared/theme/app_typography.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    this.hint,
    this.inputFormatters,
    this.prefix,
    this.suffix,
    this.obscure = false,
    this.textInputType,
    this.onChanged,
    this.enabled,
    this.controller,
    this.validator,
  });

  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final String? hint;
  final Widget? prefix;
  final Widget? suffix;
  final bool obscure;
  final TextInputType? textInputType;
  final Function(String)? onChanged;
  final bool? enabled;
  final String? validator;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextFormField(
        validator: (v) {
          String? value;
          if (validator == null) {
            return null;
          } else {
            if (validator == "name") {
              value = isValidName(v!);
            } else if (validator == "email") {
              value = isValidEmail(v!);
            } else if (validator == "password") {
              value = isValidPassword(v!);
            } else if (validator == "document") {
              value = isValidCpf(v!);
            } else if (validator == "phone") {
              value = isValidPhone(v!);
            }
            return value;
          }
        },
        inputFormatters: inputFormatters,
        controller: controller,
        obscureText: obscure,
        keyboardType: textInputType,
        onChanged: onChanged,
        enabled: enabled,
        decoration: InputDecoration(
          errorStyle: AppTypography.errorInput,
          errorMaxLines: 2,
          fillColor: AppColors.white,
          hintText: hint,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          prefixIcon: prefix,
          suffixIcon: suffix,
        ),
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }

  String? isValidName(String input) {
    final numbers = input.replaceAll(RegExp(r'[^0-9]'), '');
    if (input.length < 3) return 'Campo nome deve ter mais que 3 caracteres';
    if (numbers.isNotEmpty) return 'Campo nome não deve ter números.';
    return null;
  }

  String? isValidEmail(String input) {
    if (!GetUtils.isEmail(input)) return 'Campo email não é válido.';
    return null;
  }

  String? isValidPassword(String input) {
    if (input.length < 6) return 'Campo senha deve ter mais de 6 caracteres.';
    if (GetUtils.isNumericOnly(input) || GetUtils.isAlphabetOnly(input))
      return 'A senha deve ser composta, ao menos, por números e letras.';
    return null;
  }

  String? isValidCpf(String input) {
    if (!GetUtils.isCpf(input)) return 'Campo CPF inválido.';
    return null;
  }

  String? isValidCnpj(String input) {
    if (!GetUtils.isCnpj(input)) return 'Campo CNPJ inválido.';
    return null;
  }

  String? isValidPhone(String input) {
    if (!hasMatch(input, r'^\([1-9]{2}\) [9]{0,1}[5-9]{1}[0-9]{3}\-[0-9]{4}$'))
      return 'Campo telefone inválido.';
    return null;
  }

  bool hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }
}
