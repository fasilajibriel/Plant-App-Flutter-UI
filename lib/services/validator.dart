
import 'package:flutter/cupertino.dart';

class Validator{

  static String validatePhone(String value,BuildContext context){
    if(!value.startsWith('09')){
      return "Phone number should start with 09";
    }
    if(int.tryParse(value) == null){
      return "Phone number can only be of type number";
    }
    if(value.length != 10){
      return "Phone number has to be 10 digits";
    }
    return null;
  }

  static String validateProduct(String name, BuildContext context){
    if (name.trim().isEmpty) {
      return "Please enter your name";
    }

    return null;
  }

  static String validateQuantity(String value,BuildContext context){
    if(int.tryParse(value) == null || int.tryParse(value) <= 0){
      return "Quantity can not be less than 0";
    }
    return null;
  }

  static String validatePrice(String value,BuildContext context){
    if(int.tryParse(value) == null || int.tryParse(value) <= 0){
      return "Price can not be less than 0";
    }
    return null;
  }

  static String validatePassword(String value,BuildContext context, {bool isOtp = false}){
    if (value.trim().isEmpty) {
      return "Password field is empty";
    }
    if(value.length < 8){
      return "Password should at least be 8 characters long";
    }
    if(value.contains(" ")){
      return "Blank space isn't allowed";
    }

    return null;

  }

  static String validateName(String name, BuildContext context){
    if (name.trim().isEmpty) {
      return "Please enter your name";
    }
    if(name.contains(" ")){
      return "Blank space isn't allowed";
    }
    return null;
  }

  static String validateOptionalEmail(String email, BuildContext context){
    if (email.trim().isEmpty) {
      return null;
    }
    if (!email.contains("@")) {
      return "Email should contain @";
    }
    if (!email.contains(".")) {
      return "Email should contain a \'.something\'";
    }

    return null;
  }

  static String validateConfirmationPassword(String newPassword,String confirmNewPassword, BuildContext context){
    if(newPassword != confirmNewPassword){
      return "Password must be the same.";
    }
    return null;
  }


}