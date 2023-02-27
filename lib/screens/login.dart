import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  late EmailAuth emailAuth;
  @override
  void initState() {
    // TODO: implement initState
    emailAuth = new EmailAuth(
      sessionName: "Sample session",

    );
    super.initState();
    
  }

  void sendOTP() async {
    var res = await emailAuth.sendOtp(recipientMail: emailController.text);
    if (res) {
      print("sent");
    } else {
      print("problem with sending otp");
    }
  }

  void verify() {
    var res = emailAuth.validateOtp(
        recipientMail: emailController.text, userOtp: otpController.text);
    if (res) {
      print("otp verified");
    } else {
      print("invalid otp");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: emailController,
            ),
            ElevatedButton(
              onPressed: sendOTP,
              child: const Text("send"),
            ),
            TextField(
              controller: otpController,
            ),
            ElevatedButton(
              onPressed: verify,
              child: const Text("Verify"),
            ),
          ],
        ),
      ),
    );
  }
}
