import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void launchPhoneDialer(String number) async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: number
    );

    if (await canLaunch(phoneUri.toString())) {
      await launch(phoneUri.toString());
    } else {
      throw 'Could not launch $phoneUri';
    }
  }

  void launchEmail({
    required String toEmail,
    required String subject,
    required String body,
  }) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: toEmail,
      query: 'subject=${Uri.encodeComponent(subject)}&body=${Uri
          .encodeComponent(body)}',
    );
    if (await canLaunch(emailUri.toString())) {
      await launch(emailUri.toString());
    } else {
      throw 'Could not launch $emailUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white70,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/me.jpeg'),
                backgroundColor: Colors.red,
              ),
              Text(
                "Alberto Villarreal",
                style: GoogleFonts.oswald(
                  textStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  )
                ),
              ),
              Text("Software Engineer",
                style: TextStyle(
                  fontFamily: 'Chalkboard SE'
                )
              ),
              SizedBox(
                height: 20,
                width: 150,
                child: Divider(
                  color: Colors.grey,

                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    size: 30,
                    color: Colors.blue,),
                  title: Text('+52 871 233 5075'),
                  onTap: (){
                    launchPhoneDialer('+52 871 233 5075');
                  },
                )
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  onTap: () {
                    launchEmail(
                    toEmail: 'albertfr@live.com.mx',
                    subject: 'Flutter App',
                    body: 'TEST');
                  },
                  leading: Icon(
                    Icons.email,
                    size: 30,
                    color: Colors.blue,
                  ),
                  title: Text(
                      'dev.betoflores1358@gmail.com',
                      style: TextStyle(color: Colors.black)
                  )
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
