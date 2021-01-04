import 'package:flutter/material.dart';
import 'package:textfield_demo/utilities/custom_dialog.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  String text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField demo'),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: ListView(
          children: [
            Placeholder(
              fallbackHeight: 100,
              color: Colors.transparent,
            ),
            textFieldInput(
                controller: emailController,
                hintText: 'Email',
                icon: Icons.email),
            SizedBox(
              height: 15,
            ),
            textFieldInput(
                controller: pwdController,
                hintText: 'Password',
                icon: Icons.lock),
            SizedBox(
              height: 15,
            ),
            _buildBitton(
                onPress: () {
                  if (emailController.text == '' || pwdController.text == '') {
                    CustomDialog().alertDialog(
                        context: context,
                        title: 'Warning',
                        icon: Icons.add_alert,
                        message: 'Input your data');
                  }
                },
                text: 'Login'),
            _buildBitton(
                onPress: () {
                  CustomDialog().snackBar(context);
                },
                text: 'Register'),
          ],
        ),
      ),
    );
  }

  _buildBitton({VoidCallback onPress, String text}) {
    return RaisedButton(
      onPressed: onPress,
      child: Text('$text'),
    );
  }

  Widget textFieldInput({
    TextEditingController controller,
    String hintText,
    IconData icon,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: '$hintText',
        border: OutlineInputBorder(),
        suffixIcon: Icon(icon),
      ),
    );
  }
}
