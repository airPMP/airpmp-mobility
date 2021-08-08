// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:job_card/bloc/login_bloc/login_bloc.dart';
// import 'package:job_card/screens/select_project_page.dart';
// import 'package:job_card/utilities/constants.dart';
// import 'package:job_card/utilities/widgets.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   LoginPageState createState() => LoginPageState();
// }

// class LoginPageState extends State<LoginPage> {
//   LoginBloc _loginBloc = LoginBloc();

//   String _email = "";
//   String _password = "";
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   void initState() {
//     // not sure why we need to add listiner
//     _emailController.addListener(_emailListen);
//     _passwordController.addListener(_passwordListen);
//     super.initState();
//   }

//   void _emailListen() {
//     if (_emailController.text.isEmpty) {
//       _email = "";
//     } else {
//       _email = _emailController.text;
//     }
//   }

//   void _passwordListen() {
//     if (_passwordController.text.isEmpty) {
//       _password = "";
//     } else {
//       _password = _passwordController.text;
//     }
//   }

//   Widget _buildEmail() {
//     return Container(
//       alignment: Alignment.centerLeft,
//       decoration: kTextBoxDecorationStyle,
//       height: 60,
//       child: TextField(
//         controller: _emailController,
//         keyboardType: TextInputType.emailAddress,
//         style: TextStyle(color: Colors.black, fontFamily: 'OpenSans'),
//         decoration: InputDecoration(
//           border: InputBorder.none,
//           contentPadding: EdgeInsets.only(top: 14),
//           prefixIcon: Icon(
//             Icons.email,
//             color: Colors.black,
//           ),
//           hintText: 'Enter your email',
//           hintStyle: kHintTextStyle,
//         ),
//       ),
//     );
//   }

//   Widget _buildPassword() {
//     return Container(
//       alignment: Alignment.centerLeft,
//       decoration: kTextBoxDecorationStyle,
//       height: 60,
//       child: TextField(
//         controller: _passwordController,
//         obscureText: true,
//         style: TextStyle(color: Colors.black),
//         decoration: InputDecoration(
//           border: InputBorder.none,
//           contentPadding: EdgeInsets.only(top: 14),
//           prefixIcon: Icon(
//             Icons.vpn_key,
//             color: Colors.black,
//           ),
//           hintText: 'Enter your password',
//           hintStyle: kHintTextStyle,
//         ),
//       ),
//     );
//   }

//   Widget _buildForgotPassword() {
//     return Container(
//       alignment: Alignment.centerRight,
//       child: FlatButton(
//         child: Text(
//           "Forgot Password?",
//           style: kLabelStyle,
//         ),
//         onPressed: () => print("Forgot Pasword Button clicked"),
//         padding: EdgeInsets.only(right: 0),
//       ),
//     );
//   }

//   Widget _buildloginButton() {
//     return GestureDetector(
//       onTap: () {
//         // i'm converting the input text to string.
//         _loginBloc.dispatch(
//             Login(userName: _email.toString(), password: _password.toString()));
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 5),
//         width: 200,
//         height: 50,
//         child: Center(
//           child: Text(
//             "LOGIN",
//             style: TextStyle(
//                 color: Colors.black,
//                 letterSpacing: 1.5,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18),
//           ),
//         ),
//         decoration: kButtonBoxDecorationStyle,
//       ),
//     );
//   }

//   Widget buildLoginBody() {
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           Container(
//             height: double.infinity,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: Color(0xFFF4442E),
//             ),
//           ),
//           Container(
//             height: double.infinity,
//             width: double.infinity,
//             child: SingleChildScrollView(
//               physics: AlwaysScrollableScrollPhysics(),
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 40, vertical: 100),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Text(
//                       'Sign In',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontFamily: 'OpenSans',
//                           fontSize: 30,
//                           fontWeight: FontWeight.w500),
//                     ),
//                     SizedBox(height: 50),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           "Email",
//                           style: kLabelStyle,
//                         ),
//                         SizedBox(height: 10),
//                         _buildEmail(),
//                         SizedBox(height: 50),
//                         Text("Password", style: kLabelStyle),
//                         SizedBox(height: 10),
//                         _buildPassword(),
//                         _buildForgotPassword(),
//                         SizedBox(height: 40),
//                         Center(child: _buildloginButton()),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildLoadingBody() {
//     return Scaffold(
//       backgroundColor: Color(0xFFF4442E),
//       body: Center(
//         child: Container(
//           height: 50,
//           width: 50,
//           child: CircularProgressIndicator(
//             valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//           ),
//         ),
//       ),
//     );
//   }

//   buildLoginError() {
//     return showDialog(
//       context: context,
//       builder: (BuildContext cont) => Container(
//         height: 200,
//         width: 200,
//         child: AlertDialog(
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//           content: Text(
//             "Invalid login Credentials!",
//             style: TextStyle(fontSize: 18),
//           ),
//           actions: <Widget>[
//             FlatButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text(
//                   "okay",
//                   style: TextStyle(color: Colors.red),
//                 ))
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener(
//       bloc: _loginBloc,
//       listener: (BuildContext context, LoginState state) {
//         if (state is LoginFailed) {
//           buildLoginError();
//         }
//       },
//       child: BlocBuilder(
//         bloc: _loginBloc,
//         builder: (BuildContext context, LoginState state) {
//           if (state is LoginWaitingForCredentials) {
//             return buildLoginBody();
//           } else if (state is LoginLoading) {
//             return buildLoadingBody();
//           } else if (state is LoginFailed) {
//             return buildLoginBody();
//           } else if (state is LogedIn) {
//             return SelectProject();
//           }
//           // return buildLoginBody();
//           return stateError();
//         },
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _loginBloc.dispose();
//     super.dispose();
//   }
// }
