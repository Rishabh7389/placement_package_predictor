import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ResultPage extends StatelessWidget {
  final String result;
  const ResultPage({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              result,
              style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            SizedBox(height: 20),
            Lottie.asset("assets/images/congo.json", height: 200, width: 200),
            const Text(
              "Congratulations,",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            const Text(
              "Based on your selected skills,",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              "you are predicted to get a package $result",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to the previous screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF26206F),
              ),
              child: const Text("Go Back"),
            ),
          ],
        ),
      ),
    );
  }
}
