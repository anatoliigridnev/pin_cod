import 'package:flutter/material.dart';
import 'package:pin_cod/keypad.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(70, 70),
            elevation: 0,
            shape: CircleBorder(),
          ),
        ),
      ),
      home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            Text(
              'Enter your PIN',
              style: TextStyle(color: Color(0xAA7088af), fontSize: 23),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: 170,
              child: PinCodeTextField(
                onCompleted: (value) {
                  if (value == '1111') {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            insetPadding:
                                const EdgeInsets.symmetric(vertical: 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            title: const Center(
                              child: Text(
                                'Authentication success',
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                          );
                        });
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            insetPadding:
                                const EdgeInsets.symmetric(vertical: 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            title: const Center(
                              child: Text(
                                'Authentication rejected',
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                          );
                        });
                  }
                },
                animationDuration: Duration(microseconds: 1),
                obscuringWidget: Container(
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                controller: pinController,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.circle,
                  fieldHeight: 11,
                  fieldWidth: 11,
                  borderWidth: 1,
                  inactiveColor: Color(0xffCFD5E1),
                  activeColor: Color(0xffCFD5E1),
                ),
                
                appContext: context,
                length: 4,
                onChanged: (String value) {},
              ),
            ),
            SizedBox(
              height: 120,
            ),
            KeyPad(
              pinController: pinController,
              isPinLogin: false,
              onChange: (String pin) {},
              onSubmit: (String pin) {},
            ),
          ],
        ),
      ),
    );
  }
}
