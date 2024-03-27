import 'package:flutter/material.dart';

void main(){
  runApp(const IMCCalculator());
}

class IMCCalculator extends StatelessWidget {
  const IMCCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora IMC'),
        ),
        body: const IMCForm(),
      ),
    );
  }
}

class IMCForm extends StatefulWidget {
  const IMCForm ({super.key});

  @override
  State<IMCForm> createState() => _IMCFormState();
}

class _IMCFormState extends State<IMCForm> {



    final TextEditingController _heightController = TextEditingController();
    final TextEditingController _weightController = TextEditingController();
    String result= '';


    void _CalculateIMC(){
      final double height = double.parse(_heightController.text) / 100;
      final double weight = double.parse(_weightController.text);
      final double imc = weight / (height * height);

      String classification = '';

      if(imc < 18.5) {
        classification = 'Abaixo do Peso';
      } else if(imc >= 18.5 && imc <= 24.9){
        classification = 'Peso Normal';
      } else if (imc >= 25 && imc <= 29.9){
        classification = 'Sobrepeso';
      } else if (imc >= 30){
        classification = 'Obesidade Morbida';
      }

      setState(() {
        result = 'Seu IMC é: ${imc.toStringAsFixed(2)}\n$classification';
      });

  }
    @override
    Widget build(BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(36),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Altura (cm):',

              ),
            ),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Peso (Kg):',
            )
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _CalculateIMC,
                child: const Text('Calcular IMC')
            ),
            const SizedBox(height: 20),
            Text(result),
          ],
        ),
      );
  }
}


