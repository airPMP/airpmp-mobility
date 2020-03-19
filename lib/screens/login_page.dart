import 'package:flutter/material.dart';
import 'package:job_card/models/login_response_model.dart';
import 'package:job_card/utilities/constants.dart';
import 'package:job_card/utilities/functions.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _email = "";
  String _password = "";
  // this is set to waiting because we need to display the real login page
  // if it is set to loging in (in set state) it will show a progess indicator
  String loginStatus = 'waiting';

  void _emailListen() {
    if (_emailController.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailController.text;
    }
  }

  void _passwordListen() {
    if (_passwordController.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordController.text;
    }
  }

  @override
  void initState() {
    // not sure why we need to add listiner
    _emailController.addListener(_emailListen);
    _passwordController.addListener(_passwordListen);
    super.initState();
  }

  Widget _buildEmail() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kTextBoxDecorationStyle,
      height: 60,
      child: TextField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(color: Colors.black, fontFamily: 'OpenSans'),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14),
          prefixIcon: Icon(
            Icons.email,
            color: Colors.black,
          ),
          hintText: 'Enter your email',
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Widget _buildPassword() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kTextBoxDecorationStyle,
      height: 60,
      child: TextField(
        controller: _passwordController,
        obscureText: true,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14),
          prefixIcon: Icon(
            Icons.vpn_key,
            color: Colors.black,
          ),
          hintText: 'Enter your password',
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  Widget _buildForgotPassword() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        child: Text(
          "Forgot Password?",
          style: kLabelStyle,
        ),
        onPressed: () => print("Forgot Pasword Button clicked"),
        padding: EdgeInsets.only(right: 0),
      ),
    );
  }

  Widget _buildloginButton() {
    return GestureDetector(
      // on tapping the login button, it checks the credentials are right or not
      // if its right, it saves the token and navigates inside.
      // else it prints invalid login.
      onTap: () async {
        setState(() {
          loginStatus = 'loging in';
        });
        // i'm converting the input text to string.
        LoginDetails loginDetails = await login(
            email: _email.toString(), password: _password.toString());

        print(loginDetails);
        if (loginDetails != null) {
          await saveToken(loginDetails.token);
          await saveCompanyID(loginDetails.companyID);
          print(
              '..............................................................');
          print(loginDetails.userID);
          await saveUserID(loginDetails.userID);
          Navigator.pushNamedAndRemoveUntil(context, '/select_project',
              (Route<dynamic> route) {
            return true;
          });

          // Navigator.pushReplacementNamed(context, '/select_project');
        } else {
          // this means the login credentials are wrong
          setState(() {
            // because the user need to login again
            loginStatus = 'waiting';
          });
          showDialog(
              context: context,
              child: Container(
                height: 200,
                width: 200,
                child: AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  content: Text(
                    "Invalid login Credentials!",
                    style: TextStyle(fontSize: 18),
                  ),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "okay",
                          style: TextStyle(color: Colors.red),
                        ))
                  ],
                ),
              ));
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        width: 200,
        height: 50,
        child: Center(
          child: Text(
            "LOGIN",
            style: TextStyle(
                color: Colors.black,
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ),
        decoration: kButtonBoxDecorationStyle,
      ),
    );
  }

  Widget buildBody() {
    if (loginStatus == 'loging in') {
      return Scaffold(
        backgroundColor: Color(0xFFF4442E),
        body: Center(
          child: Container(
            height: 50,
            width: 50,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF4442E),
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign In',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 30,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 50),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Email",
                            style: kLabelStyle,
                          ),
                          SizedBox(height: 10),
                          _buildEmail(),
                          SizedBox(height: 50),
                          Text("Password", style: kLabelStyle),
                          SizedBox(height: 10),
                          _buildPassword(),
                          _buildForgotPassword(),
                          SizedBox(height: 40),
                          Center(child: _buildloginButton()),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildBody();
  }
}
