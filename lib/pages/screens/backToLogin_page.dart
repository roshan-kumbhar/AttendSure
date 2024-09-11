import 'package:attendsure/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BacktologinPage extends StatelessWidget {
  const BacktologinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.done),
            Text(
              "Account Created Successfully",
              style: TextStyle(fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Back To", style: TextStyle(fontSize: 18)),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Myroutes.loginRoute);
                    },
                    child: Text("LoginPage", style: TextStyle(fontSize: 18)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
