import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProcessingTransactionPage extends StatelessWidget {
  ProcessingTransactionPage({this.title = ''});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.send),
        title: Text(title),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Your transaction is being processed',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48.0),
              const SpinKitWanderingCubes(color: Colors.blue),
            ],
          ),
        ),
      ),
    );
  }
}
