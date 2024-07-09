import 'package:flutter/material.dart';
import 'package:progetto_totem/components/carosello_immagini.dart';
import 'package:progetto_totem/pages/order_screen.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => OrderScreen(title: "Order Screen"),
          ),
        );
      },
      child: Scaffold(
        backgroundColor: Color.fromRGBO(102, 255, 153, 0.5),
        body: Column(
          children: [
            Center(
              child: CaroselloImmagini(),
            ),
            Container(
              height: 100,
              width: 350,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 102, 153, 0.5),
                borderRadius: BorderRadius.circular(23),
              ),
              child: Center(
                child: Text(
                  "Tocca qui per iniziare!",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
