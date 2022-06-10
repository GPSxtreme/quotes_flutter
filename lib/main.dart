// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';
import 'dart:developer';

void main() => runApp(MaterialApp(
home: QuotesList(),
));

class QuotesList extends StatefulWidget {
  const QuotesList({Key? key}) : super(key: key);

  @override
  State<QuotesList> createState() => _QuotesListState();
}

class _QuotesListState extends State<QuotesList> {
  List<Quote> quotes = [
    Quote(text: 'gg get rekt', author: 'random csgo nerd'),
    Quote(text: 'gg wp', author: 'chad valo nerd'),
    Quote(text: 'lagg', author: 'avg 12 yr old'),
    Quote(text: 'lagg', author: 'avg 12 yr old'),
  ];
  late String txt;
  late String author;
  void addQuote(String text , String author){
    quotes.add(Quote(text: text, author: author));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade600,
      appBar: AppBar(
        title: Text('Quotes.',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w300,color: Colors.amber.shade400),),
        centerTitle: true,
        backgroundColor: Colors.grey.shade900,
      ),
      body: SingleChildScrollView(
        child: (
            Column(
            children:<Widget>[
              SizedBox(height: 5,),
              Row(
                children: <Widget>[
                  Expanded(
                      flex: 3,
                      child: TextField(
                        cursorHeight: 20,
                        cursorColor: Colors.grey.shade900,
                        cursorRadius: Radius.circular(15),
                        cursorWidth: 2,
                        style: TextStyle(fontSize: 15,letterSpacing: 1.2,fontWeight: FontWeight.w500,color: Colors.grey.shade900),
                        decoration:InputDecoration(
                          hintText: 'ADD QUOTE',
                          //borders
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade900),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade600),
                          ),
                      ),
                      onSubmitted: (String text){
                       setState(() {
                         txt = text;
                       }); 
                      },
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    flex: 2,
                    child: TextField(
                      cursorHeight: 20,
                      cursorColor: Colors.grey.shade900,
                      cursorRadius: Radius.circular(15),
                      cursorWidth: 2,
                      style: TextStyle(fontSize: 15,letterSpacing: 1.2,fontWeight: FontWeight.w500,color: Colors.grey.shade900),
                      decoration:InputDecoration(
                        hintText: 'ADD AUTHOR',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade900),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade600),
                        ),

                      ),
                      onSubmitted: (String text){
                        setState(() {
                          author = text;
                        });
                      },
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: FloatingActionButton(
                        backgroundColor: Colors.grey.shade900,
                        onPressed: (){addQuote(txt, author);},
                        child: Icon(Icons.done,size: 30,color: Colors.grey.shade400,),
                  ))
                ],
              ),
              Column(children: quotes.map((q) =>QuoteCard(quote: q, delete:(){setState((){quotes.remove(q);});})).toList(),),
            ],
          )),
      ),

    );
  }
}

