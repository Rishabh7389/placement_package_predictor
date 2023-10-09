import 'package:flutter/material.dart';
import 'package:placement_package_predictor/result.dart';

void main() {
  runApp(MaterialApp(
    home: PredictionPage(),
  ));
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
                fontSize: 40,
                fontWeight: FontWeight.w700,
                color: Color(0xFF26206F),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSkillContainer("AI/ML      ", 0),
                _buildSkillContainer("PYTHON      ", 1),
                _buildSkillContainer("JAVA      ", 2),
                _buildSkillContainer("DSA      ", 3),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSkillContainer("SQL      ", 4),
                _buildSkillContainer("HTML      ", 5),
                _buildSkillContainer("DEVOPS      ", 6),
                _buildSkillContainer("POWER BI      ", 7),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSkillContainer("FIGMA      ", 8),
                _buildSkillContainer("REACT JS      ", 9),
                _buildSkillContainer("NODE JS      ", 10),
                _buildSkillContainer("CPP      ", 11),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                bool anySkillSelected =
                    isCheckedList.any((isChecked) => isChecked);

                if (anySkillSelected) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResultPage()),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("No Skills Selected",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        content: Text(
                            "Please select at least one skill before predicting."),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF26206F),
                              fixedSize: const Size(100, 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(19),
                              ),
                            ),
                            child: Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                }
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
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
    Color checkboxColor = Colors.white;

    if (isCheckedList[index]) {
      containerColor = Color(0xFF87A850);
      textColor = Colors.white;
      checkboxColor = Color(0xFF87A850);
    }

    return InkWell(
      onTap: () {
        setState(() {
          isCheckedList[index] = !isCheckedList[index];
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: const Color(0xFF87A850), width: 2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: checkboxColor,
                border: Border.all(color: Colors.transparent),
              ),
              child: isCheckedList[index]
                  ? Icon(
                      Icons.check_circle_rounded,
                      size: 25,
                      color: Color.fromRGBO(255, 253, 253, 1),
                    )
                  : null,
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
      ),
    );
  }
}
