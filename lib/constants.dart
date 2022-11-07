import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

const kPrimaryColor = Color(0xFF00BF6D);
const kSecondaryColor = Color(0xFFFE9901);
const kContentColorLightTheme = Color(0xFF1D1D35);
const kContentColorDarkTheme = Color(0xFFF5FCF9);
const kWarninngColor = Color(0xFFF3BB1C);
const kErrorColor = Color(0xFFF03738);

const kDefaultPadding = 20.0;

//ScreenLogin
const kPrimaryLightColor = Color(0xFFF1E6FF);
const double defaultPadding = 16.0;


//Validator

const emailError = 'Digite uma senha válida';
const requiredField = "Este campo é obrigatorio";

final passwordValidator = MultiValidator(
  [
    RequiredValidator(errorText: 'A senha é requisitada'),
    MinLengthValidator(4, errorText: 'A senha deve ter ao menos 4 digitos'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'A senha deve ter ao menos um caracter especial')
  ],
);

