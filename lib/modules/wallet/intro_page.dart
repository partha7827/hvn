import 'package:flutter/material.dart';
import 'package:highvibe/modules/wallet/wallet_module.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const RaisedButton(
              child: Text('Create new wallet'),
              onPressed: WalletModule.toCreate,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: const OutlineButton(
                child: Text('Import wallet'),
                onPressed: WalletModule.toImport,
              ),
            )
          ],
        ),
      ),
    );
  }
}
