import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final InAppReview inAppReview = InAppReview.instance;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Text('Calculadora TMB'),
          ),
          _customList('Avaliar app', () async {
            if (await inAppReview.isAvailable()) {
              inAppReview.requestReview();
            }
          }),
          _customList('Segurança do app', () {}),
          _customList('Compartilhar app', () {}),
        ],
      ),
    );
  }

  _customList(String text, Function()? func) {
    return Column(
      children: [
        ListTile(
          title: Text(text),
          trailing: Icon(Icons.chevron_right),
          onTap: func,
        ),
        Divider(
          indent: 55,
        ),
      ],
    );
  }
}
