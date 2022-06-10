import 'package:flutter/material.dart';
import 'quote.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final VoidCallback delete;
  QuoteCard({required this.quote, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 30, 16, 0),
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(quote.text,style: TextStyle(fontSize: 20,letterSpacing: 1.2,fontWeight: FontWeight.w500,color: Colors.grey.shade900),),
            SizedBox(height: 6,),
            Text('-'+' '+quote.author,style: TextStyle(fontSize: 20,letterSpacing: 1,fontWeight: FontWeight.w400,color: Colors.grey.shade700),),
            SizedBox(height: 8,),
            TextButton.icon(onPressed: delete, label: Text('delete quote',style: TextStyle(fontSize: 15,letterSpacing: 1,fontWeight: FontWeight.w500,color: Colors.grey.shade900),),icon: Icon(Icons.delete,color: Colors.amber.shade400,),)
          ],
        ),
      ),
    );
  }
}
