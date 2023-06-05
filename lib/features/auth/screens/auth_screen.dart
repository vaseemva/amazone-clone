import 'package:amazone_clone/common/widgets/custom_button.dart';
import 'package:amazone_clone/constants/global_variables.dart';
import 'package:amazone_clone/common/widgets/custom_textfield.dart';
import 'package:amazone_clone/constants/utils.dart';
import 'package:flutter/material.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  AuthScreenState createState() => AuthScreenState();
}

class AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final signupFormKey = GlobalKey<FormState>();
  final signinFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GlobalVariables.greyBackgroundCOlor,
        body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ListTile(
              tileColor: _auth == Auth.signup
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              title: const Text(
                'Create account',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signup,
                groupValue: _auth,
                onChanged: (Auth? value) {
                  setState(() {
                    _auth = value!;
                  });
                },
              ),
            ),
            if (_auth == Auth.signup)
              Container(
                color: GlobalVariables.backgroundColor,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                      key: signupFormKey,
                      child: Column(
                        children: [
                          CustomTextfield(
                            controller: _nameController,
                            hintText: 'Name',
                          ),
                          kHeight10,
                          CustomTextfield(
                            controller: _emailController,
                            hintText: 'Email',
                          ),
                          kHeight10,
                          CustomTextfield(
                            controller: _emailController,
                            hintText: 'Password',
                          ),
                          kHeight10,
                          CustomButton(
                            text: 'SignUp',
                            ontap: () {},
                          )
                        ],
                      )),
                ),
              ),
            ListTile(
              tileColor: _auth == Auth.signin
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              title: const Text(
                'Sign-in',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signin,
                groupValue: _auth,
                onChanged: (Auth? value) {
                  setState(() {
                    _auth = value!;
                  });
                },
              ),
            ),
            if (_auth == Auth.signin)
              Container(
                color: GlobalVariables.backgroundColor,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                      key: signupFormKey,
                      child: Column(
                        children: [
                          kHeight10,
                          CustomTextfield(
                            controller: _emailController,
                            hintText: 'Email',
                          ),
                          kHeight10,
                          CustomTextfield(
                            controller: _emailController,
                            hintText: 'Password',
                          ),
                          kHeight10,
                          CustomButton(
                            text: 'SignUp',
                            ontap: () {},
                          )
                        ],
                      )),
                ),
              ),
          ],
        )));
  }
}
