import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bmi_calculator/Result_page.dart';
import 'package:bmi_calculator/Calculation_bmi.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 55;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Calculator'
        ),
        centerTitle: true,
      ),
      body:Column(
        children: [
           Expanded(
              child: CardWidgets(
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Height',
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: const TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          width: 4.0,
                        ),
                        const Text(
                          'CM',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        activeColor: Colors.pink,
                        inactiveColor: Colors.black38,
                        onChanged: (double num){
                          setState(() {
                            height = num.round();
                          });
                        }
                    ),
                  ],
                ),
              ),
          ),
          Expanded(
            child: CardWidgets(
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Weight',
                    style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                      weight.toString(),
                      style: const TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RawMaterialButton(
                          elevation: 0.0,
                          shape: const CircleBorder(),
                          fillColor: Colors.white,
                          constraints: const BoxConstraints.tightFor(
                            width: 56.0,
                            height: 56.0,
                          ),
                          onPressed: (){
                            setState(() {
                              weight++;
                            });
                          },
                          child:const Icon(
                            Icons.add,
                            color: Colors.black,
                          )
                      ),
                      const SizedBox(
                        width: 50.0,
                      ),
                      RawMaterialButton(
                          elevation: 0.0,
                          shape: const CircleBorder(),
                          fillColor: Colors.white,
                          constraints: const BoxConstraints.tightFor(
                            width: 56.0,
                            height: 56.0,
                          ),
                          onPressed: (){
                            setState(() {
                              weight--;
                            });
                          },
                          child:const Icon(
                            Icons.remove,
                            color: Colors.black,
                          )
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Calculate calc = Calculate(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  ResultPage(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                )),
              );
            },
            child: Container(
              color: Colors.redAccent,
              height: 70.0,
              width: double.infinity,
              margin:const EdgeInsets.only(top: 10.0),
              child: const Center(
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class CardWidgets extends StatelessWidget {
  const CardWidgets({super.key , required this.childCard});

  final Widget childCard;
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: childCard,
    );
  }
}
