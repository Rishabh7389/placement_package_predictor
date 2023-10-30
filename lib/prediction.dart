import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:placement_package_predictor/result.dart';
import 'package:http/http.dart' as http;

class PredictionPage extends StatefulWidget {
  const PredictionPage({Key? key}) : super(key: key);

  @override
  _PredictionPageState createState() => _PredictionPageState();
}

class _PredictionPageState extends State<PredictionPage> {
  Map<String, bool> skillsMap = {
    "AI/ML": false,
    "PYTHON": false,
    "JAVA": false,
    "DSA": false,
    "SQL": false,
    "HTML": false,
    "DEVOPS": false,
    "POWER BI": false,
    "FIGMA": false,
    "REACT JS": false,
    "NODE JS": false,
    "CPP": false,
    "C#": false,
    "PHP": false,
    "RUBY": false,
    "Swift": false,
    "KOTLIN": false,
    "CSS": false,
    "JAVASCRIPT": false,
    "GO": false,
    "RUST": false,
    "PERL": false,
    "TYPESCRIPT": false,
    "DOCKER": false,
    "AWS": false,
    "AZURE": false,
    "GCP": false,
    "MYSQL": false,
    "POSTGRESQL": false,
    "MONGODB": false,
    "REDIS": false,
    "ANGULAR": false,
    "VUE JS": false,
    "FLUTTER": false,
    "SWIFTUI": false,
    "UNITY": false,
    "BLUETOOTH": false,
    "IOT": false,
    "AR/VR": false,
    "UX/UI DESIGN": false,
    "RPA": false,
    "DATA SCIENCE": false,
    "ETL": false,
    "DOCKER COMPOSE": false,
    "JENKINS": false,
    "GIT": false,
    "BITBUCKET": false,
    "SVN": false,
    "JIRA": false,
    "SCRUM": false,
  };

  List<String> dropdownOptions2 = [
    "Mechanical Engineering",
    "Computer Science Engineering",
    "Electronics"
  ];
  List<String> dropdownOptions1 = ["Undergraduate", "Graduate", "Postgraduate"];
  String selectedOption2 = "Mechanical Engineering";
  String selectedOption1 = "Undergraduate";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const Text(
            //   "SELECT YOUR EDUCATIONAL QUALIFICATION",
            //   style: TextStyle(
            //     fontSize: 40,
            //     fontWeight: FontWeight.w700,
            //     color: Color(0xFF26206F),
            //   ),
            // ),
            // const SizedBox(height: 20),

            // // Dropdowns in a Row
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     // First Dropdown
            //     Text(
            //       "Qualification ",
            //       style: TextStyle(fontSize: 20),
            //     ),
            //     DropdownButton<String>(
            //       value: selectedOption1,
            //       onChanged: (newValue) {
            //         setState(() {
            //           selectedOption1 = newValue!;
            //         });
            //       },
            //       items: dropdownOptions1.map((option) {
            //         return DropdownMenuItem<String>(
            //           value: option,
            //           child: Text(option),
            //         );
            //       }).toList(),
            //     ),

            //     // Spacer between Dropdowns
            //     SizedBox(width: 20),

            //     // Second Dropdown
            //     Text(
            //       "Branch:",
            //       style: TextStyle(fontSize: 20),
            //     ),
            //     DropdownButton<String>(
            //       value: selectedOption2,
            //       onChanged: (newValue) {
            //         setState(() {
            //           selectedOption2 = newValue!;
            //         });
            //       },
            //       items: dropdownOptions2.map((option) {
            //         return DropdownMenuItem<String>(
            //           value: option,
            //           child: Text(option),
            //         );
            //       }).toList(),
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            const Text(
              "SELECT YOUR SKILL",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
                color: Color(0xFF26206F),
              ),
            ),
            const SizedBox(height: 20),

            // Skill Selection Rows
            Wrap(
              children: [
                for (String skillName in skillsMap.keys)
                  _buildSkillContainer(skillName),
              ],
            ),
            // Predict Button
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                bool anySkillSelected =
                    skillsMap.values.any((isChecked) => isChecked);
                String payload = "";
                if (anySkillSelected) {
                  for (int i = 0; i < skillsMap.length; i++) {
                    if (skillsMap.values.elementAt(i)) {
                      payload += skillsMap.keys.elementAt(i) + " ";
                    }
                  }
                  print(payload);
                  await http
                      .post(Uri.parse("http://127.0.0.1:8000/predict"),
                          headers: {"Content-Type": "application/json"},
                          body: jsonEncode({"skills": payload}))
                      .then((value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ResultPage(result: value.body.toString())),
                    );
                  });
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

  Widget _buildSkillContainer(String skillName) {
    Color containerColor = Colors.white;
    Color textColor = Colors.black;
    Color checkboxColor = Colors.white;

    if (skillsMap[skillName]!) {
      containerColor = Color(0xFF87A850);
      textColor = Colors.white;
      checkboxColor = Color(0xFF87A850);
    }

    return InkWell(
      onTap: () {
        setState(() {
          skillsMap[skillName] = !skillsMap[skillName]!;
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
            if (skillsMap[skillName]!)
              Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: checkboxColor,
                    border: Border.all(color: Colors.transparent),
                  ),
                  child: Icon(
                    Icons.check_circle_rounded,
                    size: 25,
                    color: Color.fromRGBO(255, 253, 253, 1),
                  )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                skillName,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
