import 'package:flutter/material.dart';

Widget defaultTextFormField(
        {required TextEditingController controller,
        bool ispassword = false,
        IconData? sufix,
        required TextInputType textType,
        Function? onSubmit,
        required FormFieldValidator<String> validator,
        required String labelText,
        bool? isClickable,
        Function? sufixPressed}) =>
    TextFormField(
      validator: validator,
      onFieldSubmitted: (s) {
        onSubmit!(s);
      },
      controller: controller,
      obscureText: ispassword,
      keyboardType: textType,
      enabled: isClickable,
      decoration: InputDecoration(
        suffixIcon: sufix != null
            ? IconButton(
                icon: Icon(sufix),
                onPressed: () {
                  sufixPressed!();
                },
              )
            : null,
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
    (Route<dynamic> route) => false);


Widget  customIcon({required String Image}){
  return  Container(
    height: 32,
    width: 32,
    decoration:  BoxDecoration(
      borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
            image: AssetImage(Image))),
  );
}