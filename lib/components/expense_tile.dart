// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ExpenseTile extends StatelessWidget {
  final String name;
  final String amount;
  final DateTime dateTime;
  const ExpenseTile({
    Key? key,
    required this.name,
    required this.amount,
    required this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text('${dateTime.day}/ ${dateTime.month}/${dateTime.year}'),
      trailing: Text("Rs $amount"),
    );
  }
}
