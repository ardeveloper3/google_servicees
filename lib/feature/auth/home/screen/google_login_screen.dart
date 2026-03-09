import 'package:firegoogleservice/feature/auth/home/HomePage.dart';
import 'package:firegoogleservice/feature/auth/home/service/auth_methode.dart';
import 'package:flutter/material.dart';

class GoogleLoginScreen extends StatefulWidget {
  const GoogleLoginScreen({super.key});

  @override
  State<GoogleLoginScreen> createState() => _GoogleLoginScreenState();
}

class _GoogleLoginScreenState extends State<GoogleLoginScreen> {
  bool _isLoading = false;
  Future<void> _signInWithGoogle() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final userCredential = await GoogleSignInService.signInWithGoogle();
      if (!mounted) return;
      if (userCredential != null) {
        if (!mounted) return;
        //Navigate the next screen is success
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Homepage()),
        );
        //sign-inSuccessfull
        print("User Sign in: ${userCredential.user?.displayName}");
      }
    } catch (e) {
      if (!mounted) return;
      print("Google login failed: $e");
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.network(
              height: 100,
              width: 100,
              "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/768px-Google_%22G%22_logo.svg.png",
            ),
          ),
         _isLoading?CircularProgressIndicator() :
             SizedBox(height: 20,),
         ElevatedButton(
             onPressed:
             (){
               _signInWithGoogle();
             }
          , child: Image.network(height: 50,width: 50,"https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/768px-Google_%22G%22_logo.svg.png"))
        ],
      ),
    );
  }
}
