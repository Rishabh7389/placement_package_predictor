import 'package:flutter/material.dart';
import 'package:placement_package_predictor/result.dart';

void main() {
  runApp(MaterialApp(
    home: PredictionPage(),
  ));
}

class CircularCheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const CircularCheckBox({
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: value ? Colors.white : Colors.black,
              width: 2), // Change border color based on the checkbox state
          color: value ? Color(0x87A850) : Colors.white,
        ),
        child: Center(
          child: value
              ? Icon(
                  Icons.check,
                  size: 16,
                  color: Colors.white,
                )
              : null,
        ),
      ),
    );
  }
}

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
            const Text(
              "SELECT YOUR SKILL",
              style: TextStyle(
                fontSize: 54,
                fontWeight: FontWeight.w700,
                color: Color(0xFF26206F),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSkillContainer("AI/ML", 0),
                _buildSkillContainer("PYTHON", 1),
                _buildSkillContainer("JAVA", 2),
                _buildSkillContainer("DSA", 3),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSkillContainer("SQL", 4),
                _buildSkillContainer("HTML", 5),
                _buildSkillContainer("DEVOPS", 6),
                _buildSkillContainer("POWER BI", 7),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSkillContainer("FIGMA", 8),
                _buildSkillContainer("REACT JS", 9),
                _buildSkillContainer("NODE JS", 10),
                _buildSkillContainer("CPP", 11),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ResultPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF26206F),
                fixedSize: const Size(200, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(19),
                ),
              ),
              child: const Text(
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
    Color containerColor = Colors.white;
    Color textColor = Colors.black;

    if (isCheckedList[index]) {
      containerColor = Color(
          0xFF87A850); // Change container color to green when checkbox is selected
      textColor =
          Colors.white; // Change text color to white when checkbox is selected
    }

    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: 8, vertical: 4), // Add margin for spacing
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: const Color(0xFF87A850), width: 2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularCheckBox(
            value: isCheckedList[index],
            onChanged: (bool? value) {
              setState(() {
                isCheckedList[index] = value ?? false;
              });
            },
          ),
          const SizedBox(width: 8),
          Text(
            skillName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
