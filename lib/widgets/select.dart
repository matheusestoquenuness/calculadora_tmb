import 'package:calculadora_basal/calculate.dart';
import 'package:flutter/material.dart';

class SetGen extends StatefulWidget {
  const SetGen({Key? key}) : super(key: key);

  @override
  _SetGenState createState() => _SetGenState();
}

class _SetGenState extends State<SetGen> {
  bool selectColor = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: GridView.count(
        crossAxisCount: 2,
        children: [
          cardSelect(
              Icons.female_rounded, selectColor ? Colors.grey : Colors.pink,
              () {
            setState(() {
              selectColor = !selectColor;
              setGen = false;
            });
          }),
          cardSelect(
              Icons.male_outlined, selectColor ? Colors.blue : Colors.grey, () {
            setState(() {
              selectColor = !selectColor;
              setGen = true;
            });
          })
        ],
      ),
    );
  }

  cardSelect(
    IconData icon,
    Color color,
    Function()? ontap,
  ) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Material(
        child: InkWell(
          onTap: ontap,
          child: Container(
            child: Icon(
              icon,
              size: 50,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
