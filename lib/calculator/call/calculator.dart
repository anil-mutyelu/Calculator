import 'package:flutter/material.dart';
import 'homePage.dart';

class Calculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CalculatorState();
  }
}

class _CalculatorState extends State<Calculator> {
  var no1Controller = TextEditingController();
  var no2Controller = TextEditingController();
  var result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Calculator',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.lightBlue,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 220,
                child: TextField(
                  controller: no1Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter number',
                    labelText: 'Enter your number',
                    labelStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 220,
                child: TextField(
                  controller: no2Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter number',
                    labelText: 'Enter your number',
                    labelStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        var no1 = int.parse(no1Controller.text);
                        var no2 = int.parse(no2Controller.text);
                        var sum = no1 + no2;
                        setState(() {
                          result = '$sum';
                        });
                      },
                      child: Text('ADD'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        var no1 = int.parse(no1Controller.text);
                        var no2 = int.parse(no2Controller.text);
                        var diff = no1 - no2;
                        setState(() {
                          result = '$diff';
                        });
                      },
                      child: Text('SUB'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        var no1 = int.parse(no1Controller.text);
                        var no2 = int.parse(no2Controller.text);
                        var mult = no1 * no2;
                        setState(() {
                          result = '$mult';
                        });
                      },
                      child: Text('MUL'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        var no1 = int.parse(no1Controller.text);
                        var no2 = int.parse(no2Controller.text);
                        var divv = no1 / no2;
                        setState(() {
                          result = '$divv';
                        });
                      },
                      child: Text('DIV'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 300,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Center(
                    child: Text(
                      result,
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
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
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
