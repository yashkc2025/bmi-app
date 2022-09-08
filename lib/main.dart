import 'package:flutter/material.dart';

void main() {
  runApp(const Bmi());
}

class Bmi extends StatefulWidget {
  const Bmi({super.key});

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  TextEditingController _height = TextEditingController();
  TextEditingController _weight = TextEditingController();
  double _bmi = 0;
  String _result = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
            child: Scaffold(
                backgroundColor: Colors.black,
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  title: const Center(
                    child: Text(
                      'BMI Calculator',
                      style: TextStyle(color: Colors.amber, fontSize: 30),
                    ),
                  ),
                ),
                body: Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 130,
                          child: TextField(
                            controller: _height,
                            style: const TextStyle(
                                fontSize: 40, color: Colors.white),
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                hintText: "Height",
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.white)),
                          ),
                        ),
                        SizedBox(
                          width: 130,
                          child: TextField(
                            controller: _weight,
                            style: const TextStyle(
                                fontSize: 40, color: Colors.white),
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                hintText: "Width",
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 40),
                    Container(
                      child: Text(
                        _bmi.toStringAsFixed(2),
                        style: TextStyle(fontSize: 90, color: Colors.amber),
                      ),
                    ),
                    SizedBox(height: 10),
                    Visibility(
                        visible: _result.isNotEmpty,
                        child: Container(
                          child: Text(
                            _result,
                            style: TextStyle(fontSize: 32, color: Colors.amber),
                          ),
                        )),
                    SizedBox(
                      height: 80,
                    ),
                    GestureDetector(
                      onTap: () {
                        double _h = double.parse(_height.text);
                        double _w = double.parse(_weight.text);
                        setState(() {
                          _bmi = _w / (_h * _h);
                          if (_bmi > 25) {
                            _result = "You are over weight";
                          } else if (_bmi >= 18.5 && _bmi <= 25) {
                            _result = "You have normal weight";
                          } else {
                            _result = "You are under weight";
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(12)),
                            child: const Text(
                              'Calculate',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                  ],
                ))));
  }
}
