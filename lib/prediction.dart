import 'package:flutter/material.dart';

class PredictionPage extends StatefulWidget {
  const PredictionPage({Key? key}) : super(key: key);

  @override
  _PredictionPageState createState() => _PredictionPageState();
}

class _PredictionPageState extends State<PredictionPage> {
  List<bool> isCheckedList = List.generate(12, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "SELECT YOUR SKILL",
              style: TextStyle(
                fontSize: 54,
                fontWeight: FontWeight.w700,
                color: Color(0xFF26206F),
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSkillContainer("SKILL 1", 0),
                _buildSkillContainer("SKILL 2", 1),
                _buildSkillContainer("SKILL 3", 2),
                _buildSkillContainer("SKILL 4", 3),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSkillContainer("SKILL 5", 4),
                _buildSkillContainer("SKILL 6", 5),
                _buildSkillContainer("SKILL 7", 6),
                _buildSkillContainer("SKILL 8", 7),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSkillContainer("SKILL 9", 8),
                _buildSkillContainer("SKILL 10", 9),
                _buildSkillContainer("SKILL 11", 10),
                _buildSkillContainer("SKILL 12", 11),
              ],
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Handle the button press
                // Add your prediction logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF26206F),
                fixedSize: Size(200, 60),

                // Set the width and height of the button
              ),
              child: Text(
                "PREDICT NOW!",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillContainer(String skillName, int index) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: isCheckedList[index],
            onChanged: (bool? value) {
              setState(() {
                isCheckedList[index] = value ?? false;
              });
            },
          ),
          SizedBox(width: 8),
          Text(
            skillName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PredictionPage(),
  ));
}
