import 'package:digi_bell/home.dart';
import 'package:digi_bell/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Mylogin extends StatefulWidget {
  const Mylogin({Key? key}) : super(key: key);

  @override
  State<Mylogin> createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {


  var countrycode = TextEditingController();
  var mobileController = TextEditingController();
  var otpController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  var phone = "";
  var ourOTP = "";
  var veriID = "";

  sendOTP({phone})async
  {
    await auth.verifyPhoneNumber(

        phoneNumber: '${countrycode.text+phone}',
        verificationCompleted: (phoneAuthCredential) async
        {
          await auth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.toString());
        },
        codeSent: (String? verificationID, int? resendToken) {
          veriID = verificationID.toString();
        },
        codeAutoRetrievalTimeout: (value) {}
    );
  }
    loginMethod()async
    {
       try{
         PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: veriID, smsCode: otpController.text);

         await auth.signInWithCredential(credential);
         Navigator.push(context, MaterialPageRoute(builder: (context) => const Myhome()));

       }
       on FirebaseAuthException catch(e)
      {
            print(e.toString());
      }
    }


  @override
  void initState() {
    // TODO: implement initState
    countrycode.text =  "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  padding: const EdgeInsets.only(left:35, right: 35, top: 35),
                  child: Column(
                    children: [
                      TextField(
                        controller: mobileController,
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
                      SizedBox(height: 30),
                      ElevatedButton(
                        child: Text("Get Verification Code"),
                        onPressed: () {
                          sendOTP(phone: mobileController.text );

                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: Color(0xFFFF5E5E),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        controller: otpController,
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: TextStyle(letterSpacing: 3),
                        decoration: InputDecoration(
                            // fillColor: Colors.grey.shade100,
                            filled: false,
                            hintText: 'Enter OTP',

                        ),
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        child: Text("LOGIN",
                        style: TextStyle(
                          fontSize: 20
                        )),
                        onPressed: () {
                          loginMethod();
                        },
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
                height: MediaQuery.of(context).size.height/2,
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
                    Text(" Don't have an account? "),
                    TextButton(onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) => Mysignup(),
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
                      );
                    }, child: Text('Sign Up')),
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
