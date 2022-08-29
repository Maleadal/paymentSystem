import 'package:flutter/material.dart';

class PaymentView extends StatefulWidget {
  final String type;
  const PaymentView({Key? key, required this.type}) : super(key: key);

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment - ${widget.type}'),
      ),
    );
  }
}
