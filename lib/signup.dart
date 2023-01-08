import 'package:digi_bell/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mysignup extends StatefulWidget {
  const Mysignup({Key? key}) : super(key: key);

  @override
  State<Mysignup> createState() => _MysignupState();
}

class _MysignupState extends State<Mysignup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,

      body: SingleChildScrollView(
        child: Container(
          height:  MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xffFF5E5E),
                width: 5,
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0,20,0,0),
                  child: Container(
                    height: MediaQuery.of(context).size.height/4,
                      child: Image.asset('assets/logodigibell.png')
                  ),
                ),
              ),


            Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left:35, right: 35, top: 20,bottom: 20),
                      child: Column(
                        children: [
                          TextField(

                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: 'Full Name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(

                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: 'Gender',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: 'Age',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: 'Phone Number',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            child: Text("Get Verification Code"),
                            onPressed: () => print("it's pressed"),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white, backgroundColor: Color(0xFFFF5E5E),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                            ),
                          ),

                          TextField(
                            obscureText: false,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: TextStyle(letterSpacing: 3),
                            decoration: InputDecoration(
                              // fillColor: Colors.grey.shade100,
                              filled: false,
                              hintText: 'Enter OTP',

                              // border: OutlineInputBorder(
                              //   borderRadius: BorderRadius.circular(10),
                              // )
                            ),
                          ),
                          SizedBox(height: 10),

                          ElevatedButton(
                            child: Text("SIGN UP",
                                style: TextStyle(
                                    fontSize: 20
                                )),
                            onPressed: () => print("it's pressed"),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white, backgroundColor: Color(0xFFFF5E5E),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //height: MediaQuery.of(context).size.height/0.7,
                    width: MediaQuery.of(context).size.width,

                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color( 0xFFFFD088)
                    ),
                  ),
                ),

              Expanded(

                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,//Center Row contents horizontally,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(" Already have an account? "),
                      TextButton(onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) => Mylogin(),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ),
                        );
                      }, child: Text('LOGIN')),
                    ],
                  ),
                ),
              )
            ],


          ),
        ),
      ),
    );
  }
}
