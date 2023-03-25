import 'package:flutter/material.dart';
import 'home.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 179, 179, 179),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(child: Text('')),
            const Expanded(
                flex: 2,
                child: Hero(
                  tag: "logo",
                  child: Image(image: AssetImage('assets/NSRD-12in.png')),
                )),
            Expanded(
                child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text('Welcome to Natural State Roller Derby',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text('Track Access',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                        Text(''),
                        Text(
                          'Please sign in below with your Google account',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ))),
            Expanded(
                child: Container(
                    alignment: Alignment.center,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          OutlinedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Home()),
                                );
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(45)))),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Image(
                                    image: AssetImage('assets/google.png'),
                                    height: 50,
                                  ),
                                  SizedBox(
                                    width: 15,
                                    height: 75,
                                  ),
                                  Text(
                                    'Login with Google',
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              ))
                        ]))),
          ],
        ));
  }
}
