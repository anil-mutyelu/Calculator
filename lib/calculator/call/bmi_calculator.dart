import 'package:flutter/material.dart';
import 'homePage.dart';

class BMI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BMIState();
  }
}

class BMIState extends State<BMI> {
  var result;
  var wtController = TextEditingController();
  var htController = TextEditingController();
  var inchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "BMI Calculator",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w800,
                  color: Colors.lightBlueAccent,
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: 300,
                height: 60,
                child: TextField(
                  controller: wtController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Enter your weight kg',
                    prefixIcon: Icon(Icons.access_time_sharp),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: 300,
                height: 60,
                child: TextField(
                  controller: htController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Enter your height cm',
                    prefixIcon: Icon(Icons.accessibility_rounded),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    var wtt = wtController.text.toString();
                    var htt = htController.text.toString();
                    var inch = inchController.text.toString();

                    if (wtt != "" && htt != "") {
                      var wightt = int.parse(wtt);
                      var heightt = int.parse(htt);
                      var b = heightt / 100;
                      var c = b * b; // meter conversion
                      var bmi = wightt / c;
                      var msg = "";

                      if (bmi > 25) {
                        msg = " Your Over Weight...!   ";
                      } else if (bmi < 18) {
                        msg = " Your Under Weight...!  ";
                      } else {
                        msg = " Your Healthy...!  ";
                      }

                      setState(() {
                        result = "$msg  \n Your BMI is ${bmi.toStringAsFixed(4)}";
                      });
                    } else {
                      setState(() {
                        result = " Please Enter Your Values";
                      });
                    }
                  },
                  child: Container(
                    child: Text(
                      'Calculate',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: 300,
                height: 60,
                child: Center(child: Text("$result")),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.all(30),
                width: 100,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  child: Center(
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Text("Back"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
