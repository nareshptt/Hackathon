import 'package:flutter/material.dart';

class UIHelper {
  static CustomTextfield(TextEditingController controller, String text,
      IconData iconData, bool toHide) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      child: TextField(
        controller: controller,
        obscureText: toHide,
        decoration: InputDecoration(
            hintText: text,
            suffixIcon: Icon(iconData),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
      ),
    );
  }

  static CustomButton(VoidCallback voidCallback, String text) {
    return SizedBox(
      height: 50,
      width: 200,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          onPressed: () {
            voidCallback();
          },
          child: Text(
            text,
            style: TextStyle(color: Colors.black, fontSize: 20),
          )),
    );
  }

  static customAlert(BuildContext context, String text) {
    return AlertDialog(
      title: Text(text),
    );
  }
}
