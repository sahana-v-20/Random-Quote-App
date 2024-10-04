import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class RandomQuote extends StatefulWidget {
  const RandomQuote({super.key});

  @override
  State<RandomQuote> createState() => _RandomquoteState();
}

class _RandomquoteState extends State<RandomQuote> {
  String quote = "";
  String author = "";
  Future<void> fetchdata() async {
    final response =
        await http.get(Uri.parse("https://zenquotes.io/api/random"));
    List jsonBody = json.decode(response.body); //call me hlo

    setState(() {
      quote = jsonBody[0]['q'];
      author = jsonBody[0]['a'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Random Quote Generator",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: const Color.fromARGB(255, 200, 91, 83),
                        backgroundColor:
                            const Color.fromARGB(255, 239, 178, 240),
                        elevation: 10,
                        shadowColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        minimumSize: Size(150, 50),
                        textStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    onPressed: () {
                      fetchdata();
                    },
                    child: Text("Click Quote")),
              ],
            ),
            SizedBox(height: 50),
            Text(
              "The displayed Quote is :  ",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 15),
            Text(
              "${quote} ",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Text(
              " - ${author}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
