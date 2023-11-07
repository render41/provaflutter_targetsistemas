import 'package:flutter/material.dart';
import 'package:provaflutter_targetsistemas/common/style/app_style.dart';

Widget loginTextField(
    BuildContext context, {
      void Function(String)? onChanged,
      double widthResponsive = 0.5,
      Icon? icon,
      String text = '',
      String errorText = '',
      bool obscureText = false,
    }) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * widthResponsive,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(7.0),
          child: Text(text, style: const TextStyle(fontSize: 15)),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppStyle.primaryColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: [
              TextField(
                onChanged: onChanged,
                style: const TextStyle(color: AppStyle.secondaryColor),
                obscureText: obscureText,
                decoration: InputDecoration(
                  prefixIcon: icon,
                  focusedErrorBorder: removeLinesBorders,
                  focusedBorder: removeLinesBorders,
                  errorBorder: removeLinesBorders,
                ),
              ),
            ],
          ),
        ),
        if (errorText.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 8.0),
            child: Text(
              errorText,
              style: TextStyle(
                color: AppStyle.errorBaseColor,
                fontWeight: FontWeight.w600,
                fontSize: 15.0 * MediaQuery.of(context).textScaleFactor,
              ),
            ),
          ),
      ],
    ),
  );
}

OutlineInputBorder get removeLinesBorders {
  return const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent, strokeAlign: 0, width: 0),
    gapPadding: 0,
    borderRadius: BorderRadius.zero,
  );
}

