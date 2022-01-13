import 'package:flutter/material.dart';

class KeyPad extends StatelessWidget {
  // double buttonSize = 60.0;
  final TextEditingController pinController;
  final Function onChange;
  final Function onSubmit;
  final bool isPinLogin;

  KeyPad(
      {required this.onChange,
      required this.onSubmit,
      required this.pinController,
      required this.isPinLogin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonWidget('1'),
              buttonWidget('2'),
              buttonWidget('3'),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonWidget('4'),
              buttonWidget('5'),
              buttonWidget('6'),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonWidget('7'),
              buttonWidget('8'),
              buttonWidget('9'),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: 30),
              buttonWidget('0'),
              !isPinLogin
                  ? iconButtonWidget(Icons.backspace, () {})
                  : Container(
                      width: 50,
                    ),
            ],
          ),
        ],
      ),
    );
  }

  buttonWidget(String buttonText) {
    return Container(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Color(0xFFebedf4),
          ),
        ),
        onPressed: () {
          if (pinController.text.length <= 3) {
            pinController.text = pinController.text + buttonText;
            onChange(pinController.text);
          }
        },
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Color(0xAA7088af),
                fontSize: 25),
          ),
        ),
      ),
    );
  }

  iconButtonWidget(IconData icon, Function function) {
    return InkWell(
      onTap: () {
                      if (pinController.text.length > 0) {
                        pinController.text = pinController.text
                            .substring(0, pinController.text.length - 1);
                      }
                      if (pinController.text.length > 5) {
                        pinController.text = pinController.text.substring(0, 4);
                      }
                      onChange(pinController.text);
                    },
      child: Container(
        decoration:
            BoxDecoration(color: Colors.transparent, shape: BoxShape.circle),
        child: Center(
          child: Icon(
            icon,
            size: 30,
            color: Color(0xff282c4b),
          ),
        ),
      ),
    );
  }
}
