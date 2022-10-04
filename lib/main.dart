import 'package:flutter/material.dart';
import 'package:endurance_fitness/homescreen.dart'; //import 'package:flutter/widgets.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

//void main() => runApp(MyApp());

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Endurance Home', //'Flutter Demo',
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "ENDURANCE\n",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 400,
                  width: 300,
                  color: Colors.red,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.network(
                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                  ),
                ),
                Container(
                  height: 400,
                  width: 300,
                  color: Colors.red,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomeScreenWidget()));
                      },
                      child: Container(
                        color: Colors.yellow.shade600,
                        padding: const EdgeInsets.all(8),
                        // Change button text when light changes state.
                        child: Text('TURN LIGHT OFF'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
