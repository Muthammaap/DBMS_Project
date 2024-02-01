import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pages/about_page.dart';
import '../pages/doctors_page.dart';
import '../pages/home_page.dart';
import '../pages/pharmacy_page.dart';
import '../pages/services_page.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff373e98),
      height: 60.0,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          SizedBox(
            width: 100.0,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Row(
              children: [
                Icon(
                  Icons.favorite_rounded,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'HealthSync Hub',
                  style:
                      GoogleFonts.nunito(color: Colors.white, fontSize: 18.0),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 190.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HeaderNav(
                selected: true,
                text: 'Home',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
              SizedBox(
                width: 40.0,
              ),
              HeaderNav(
                selected: false,
                text: 'Doctors',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Doctors()));
                },
              ),
              SizedBox(
                width: 40,
              ),
              HeaderNav(
                selected: false,
                text: 'Services',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Services()));
                },
              ),
              SizedBox(
                width: 40,
              ),
              HeaderNav(
                selected: false,
                text: 'Pharmacy',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Pharmacy()));
                },
              ),
              SizedBox(width: 40),
              /* HeaderNav(
                selected: false,
                text: 'Appointments',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyAppointments()));
                },
              ),*/
              HeaderNav(
                selected: false,
                text: 'About Us',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutPage()));
                },
              ),
            ],
          ),
          SizedBox(
            width: 150.0,
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  _showSignUpDialog(context);
                },
                child: Text(
                  'Sign Up',
                  style: GoogleFonts.nunito(
                    fontSize: 13.0,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Container(
                height: 20.0,
                width: 1.0,
                color: Colors.white,
              ),
              SizedBox(
                width: 10.0,
              ),
              InkWell(
                onTap: () {
                  _showLoginDialog(context);
                },
                child: Text(
                  'Log In',
                  style: GoogleFonts.nunito(
                    fontSize: 13.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showSignUpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sign Up'),
          content: SingleChildScrollView(
            child: Container(
              width: 350,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/login.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 250),
                      _buildTextFieldWithIcon(
                        labelText: 'Name',
                        icon: Icons.person,
                      ),
                      SizedBox(height: 10),
                      _buildTextFieldWithIcon(
                        labelText: 'Email',
                        icon: Icons.email,
                      ),
                      SizedBox(height: 10),
                      _buildTextFieldWithIcon(
                        labelText: 'Password',
                        icon: Icons.lock,
                        obscureText: true,
                      ),
                      SizedBox(height: 10),
                      _buildTextFieldWithIcon(
                        labelText: 'Phone Number',
                        icon: Icons.phone,
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already Have an Account?',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          SizedBox(height: 3),
                          GestureDetector(
                            onTap: () {
                              _showLoginDialog(context);
                            },
                            child: Text(
                              ' Login',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.blueGrey,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle the submit action
                Navigator.pop(context);
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  void _showLoginDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Log In'),
          content: SingleChildScrollView(
            child: Container(
              width: 350,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/login.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 250),
                      _buildTextFieldWithIcon(
                        labelText: 'Email',
                        icon: Icons.email,
                      ),
                      SizedBox(height: 10),
                      _buildTextFieldWithIcon(
                        labelText: 'Password',
                        icon: Icons.lock,
                        obscureText: true,
                      ),
                      SizedBox(height: 5),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Forgot Password',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blueGrey,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        "Don't have an account?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 3),
                      GestureDetector(
                        onTap: () {
                          _showSignUpDialog(context);
                        },
                        child: Text(
                          'Sign Up',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blueGrey,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTextFieldWithIcon({
    required String labelText,
    required IconData icon,
    bool obscureText = false,
  }) {
    return Container(
      height: 50,
      width: 350,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
        color: Colors.white,
      ),
      child: TextField(
        obscureText: obscureText,
        style: TextStyle(fontSize: 12),
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(
            icon,
            color: Colors.blueGrey,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class HeaderNav extends StatefulWidget {
  final String text;
  final bool selected;
  final VoidCallback? onTap;

  HeaderNav({
    required this.selected,
    required this.text,
    this.onTap,
  });

  @override
  _HeaderNavState createState() => _HeaderNavState();
}

class _HeaderNavState extends State<HeaderNav> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.text,
            style: GoogleFonts.nunito(
              fontSize: 13.0,
              color: Colors.white,
            ),
          ),
          widget.selected
              ? SizedBox(
                  height: 5.0,
                )
              : SizedBox(),
          widget.selected
              ? CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 2.0,
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
