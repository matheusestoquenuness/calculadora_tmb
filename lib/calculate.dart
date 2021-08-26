import 'dart:ui';

import 'package:calculadora_basal/util/constantes.dart';
import 'package:calculadora_basal/widgets/custom_button.dart';
import 'package:calculadora_basal/widgets/custom_drawer.dart';
import 'package:calculadora_basal/widgets/input_text.dart';
import 'package:calculadora_basal/widgets/select.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';

bool setGen = false;

class CalculatePage extends StatefulWidget {
  const CalculatePage({Key? key}) : super(key: key);

  @override
  _CalculatePageState createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  final InAppReview inAppReview = InAppReview.instance;
  bool _isLoading = true;

  void calculate() {
    height = double.parse(heightController.text);
    weight = double.parse(weightController.text);
    year = double.parse(yearController.text);

    if (setGen = true) {
      tmb = 66 + (13.8 * weight) + (5 * height) - (6.8 * year);
      setState(() {
        result =
            'Sua taxa metabolica basal é de\n${tmb.toStringAsFixed(2)}kcal';
      });
    } else if (setGen = false) {
      tmb = 655 + (9.6 * weight) + (1.8 * height) - (4.7 * year);
      setState(() {
        result =
            'Sua taxa metabolica basal é de\n${tmb.toStringAsFixed(2)}kcal';
      });
    }
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/man.png',
                scale: 6,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                result,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17, fontFamily: 'avenir'),
              )
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    tmb = 0;
                  });
                },
                child: Text('Concluir'))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: _isLoading ? AppBar() : null,
      body: _isLoading
          ? Column(
              children: [
                Flexible(
                    child: ListView(
                  children: [
                    SetGen(),
                    customInput(weightController, 'Insira seu peso'),
                    customInput(heightController, 'Insira sua altura (cm)'),
                    customInput(yearController, 'Insira sua idade'),
                    customButton(() {
                      calculate();
                    }),
                    TextButton(
                      onPressed: () async {
                        if (await inAppReview.isAvailable()) {
                          inAppReview.requestReview();
                        }
                      },
                      child: Text('Avaliar App!'),
                    ),
                  ],
                ))
              ],
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
