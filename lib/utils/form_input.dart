import 'package:formz/formz.dart';
import 'package:get/get.dart';
import 'package:tms/utils/string_extension.dart';

enum ValidationError {
  empty(errorText: "This field can't be empty"),
  passwordIncorrect(
      errorText: "Use 8 or more characters with letters, numbers and symbols"),
  passwordNotSame(errorText: "Passwords do not match"),
  invalidEmail(errorText: "Please enter a valid email address");
  const ValidationError({required this.errorText});
  final String errorText;
}

class TextInput extends FormzInput<String, ValidationError> {
  const TextInput.pure({String value = ''}) : super.pure(value);
  const TextInput.dirty({String value = ''}) : super.dirty(value);
  @override
  ValidationError? validator(String? value) => isPure
      ? null
      : value == null || value.isWhiteSpace
          ? ValidationError.empty
          : null;
}

class NumberInput extends FormzInput<int, ValidationError> {
  const NumberInput.pure({int value = 0}) : super.pure(value);
  const NumberInput.dirty({int value = 0}) : super.dirty(value);
  @override
  ValidationError? validator(int? value) => isPure
      ? null
      : value == null || value == 0
          ? ValidationError.empty
          : null;
}

class PasswordInput extends FormzInput<String, ValidationError> {
  const PasswordInput.pure() : super.pure('');

  const PasswordInput.dirty({String value = ''}) : super.dirty(value);
  static final RegExp _passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#])[A-Za-z\d@$!%*?&#]{8,}$');

  @override
  ValidationError? validator(String? value) => isPure
      ? null
      : value == null || value.isWhiteSpace
          ? ValidationError.empty
          : _passwordRegex.hasMatch(value)
              ? null
              : ValidationError.passwordIncorrect;
}

class EmailInput extends FormzInput<String, ValidationError> {
  const EmailInput.pure() : super.pure('');

  const EmailInput.dirty({String value = ''}) : super.dirty(value);

  @override
  ValidationError? validator(String? value) => isPure
      ? null
      : value == null || value.isWhiteSpace
          ? ValidationError.empty
          : !value.isEmail
              ? ValidationError.invalidEmail
              : null;
}
