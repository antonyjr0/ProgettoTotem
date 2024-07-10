import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:progetto_totem/components/footer_bar.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.asset(
                    'lib/images/pexels-david-disponett-1118410-16560504.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 30,
                  sigmaY: 30,
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 105, 180, 0.5),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      //logo
                      Center(
                        child: Row(
                          children: [
                            //Image.asset(),
                          ],
                        ),
                      ),
                      // Bottone Indietro ------- Dove Vuoi Pagare? ------- Bottone Info
                      Row(),
                      // Bottone Pagare Alla Cassa ------- Pagare Qui
                      Row(),
                      // Bottone Annulla l'ordine
                      Row(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 5),
        height: 100,
        child: FooterBar(),
      ),
    );
  }
}
