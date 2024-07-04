import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/HomePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _phoneNumberController = TextEditingController();

  void _verifyPhone() async {
    final String phoneNumber = '+91${_phoneNumberController.text.trim()}';

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) =>  YouTubeHome()),
          );
        },
        verificationFailed: (FirebaseAuthException e) {
          print('Verification failed: ${e.message}');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Verification failed. Please try again.')),
          );
        },
        codeSent: (String verificationId, int? resendToken) {
          print('Code sent to $phoneNumber');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OTP(verificationId: verificationId),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print('Auto retrieval timeout for verification ID: $verificationId');
        },
      );
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Rendering LoginPage');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 250,
            child: Image.network("https://bevouliin.com/wp-content/uploads/2014/02/video-television-tv-movie-logo-template-preview-bevouliin.jpg"),
            ),
            TextField(
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(labelText: 'Phone Number',border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25),)
              ),
              suffixIcon: Icon(Icons.phone)
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _verifyPhone,
              child: const Text('Verify Phone'),
            ),
          ],
        ),
      ),
    );
  }
}

class OTP extends StatefulWidget {
  final String verificationId;

  const OTP({Key? key, required this.verificationId}) : super(key: key);

  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  final TextEditingController _otpController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _verifyOTP() async {
    final String smsCode = _otpController.text.trim();

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: smsCode,
      );

      await _auth.signInWithCredential(credential);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => YouTubeHome()),
      );
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid OTP. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Rendering OTP Page');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar( 
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: 250,
            child: Image.network("https://bevouliin.com/wp-content/uploads/2014/02/video-television-tv-movie-logo-template-preview-bevouliin.jpg"),
            ),
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'OTP',hintText: "Enter OTP",
              border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25),)
              ),
              ),
              
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _verifyOTP,
              child: const Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }
}


