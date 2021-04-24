import 'package:flutter/material.dart';
import 'package:weblanding/layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  static TextStyle normalText =
      TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 16);

  static TextStyle focusedText =
      TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600);

  Widget bigScreenHome(BuildContext context, Size size) {
    return Row(
      children: [bigScreenHomeLeft(context, size), bigScreenHomeRight(size)],
    );
  }

  final FocusNode emailFocus = FocusNode();
  final FocusNode phoneFocus = FocusNode();

  Widget bigScreenHomeLeft(BuildContext context, Size size) {
    return Container(
      child: LayoutSizer(
          largeScreen: Container(
        padding: EdgeInsets.symmetric(horizontal: 200),
        width: size.width / 2,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Wecode',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(
              height: 80,
            ),
            Text(
              'Get Started',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                  fontSize: 32,
                  color: Colors.black),
            ),
            SizedBox(
              height: 5,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(text: 'Already have an account? ', style: normalText),
              TextSpan(
                text: 'Sign In',
                style: focusedText,
              )
            ])),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              onFieldSubmitted: (value) =>
                  FocusScope.of(context).requestFocus(emailFocus),
              decoration: InputDecoration(
                  labelText: 'Your Name', labelStyle: normalText),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              focusNode: emailFocus,
              onFieldSubmitted: (value) =>
                  FocusScope.of(context).requestFocus(phoneFocus),
              decoration: InputDecoration(
                  labelText: 'Your Email', labelStyle: normalText),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              focusNode: phoneFocus,
              onFieldSubmitted: (value) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                  labelText: 'Your Phone', labelStyle: normalText),
            ),
            SizedBox(
              height: 60,
            ),
            MaterialButton(
              onPressed: () => print('I want to Sign In'),
              color: Colors.black,
              minWidth: size.width,
              padding: EdgeInsets.all(16),
              child: Text(
                'Sign Up',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'By signing up you agree to our',
              style: normalText,
            ),
            SizedBox(
              height: 5,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(text: 'Privacy Policy', style: focusedText),
              TextSpan(text: ' and ', style: normalText),
              TextSpan(text: 'Terms of Service', style: focusedText),
            ]))
          ],
        ),
      )),
    );
  }

  Widget bigScreenHomeRight(Size size) {
    return Container(
      width: size.width / 2,
      height: size.height,
      color: Colors.pink,
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: LayoutSizer(largeScreen: bigScreenHome(context, size)),
      ),
    );
  }
}
