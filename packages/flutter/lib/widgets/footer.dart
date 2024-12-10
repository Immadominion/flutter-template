import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height * 0.1,
      padding: const EdgeInsets.all(16.0),
      color: Colors.grey[200],
      child: const Center(
        child: Text('Developed with 🖤 by the Celo DevRel team.'),
      ),
    );
  }
}
