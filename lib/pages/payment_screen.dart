import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:progetto_totem/components/footer_bar.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //logo
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.asset(
                              'lib/images/logo_3.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      // Bottone Indietro ------- Dove Vuoi Pagare? ------- Bottone Info
                      Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: FaIcon(
                                        FontAwesomeIcons.arrowLeft,
                                        size: 20,
                                      ),
                                    ),
                                    Text(
                                      "Dove vuoi pagare?",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: FaIcon(
                                          FontAwesomeIcons.info,
                                          size: 20,
                                        ))
                                  ],
                                ),
                                // Bottone Pagare Alla Cassa ------- Pagare Qui
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    OutlinedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Center(
                                              child: SizedBox(
                                                height: 100,
                                                width: 100,
                                                child: Image.asset(
                                                  'lib/images/logo_3.png',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text('Paga Qui'),
                                        ],
                                      ),
                                    ),
                                    OutlinedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Center(
                                              child: SizedBox(
                                                height: 100,
                                                width: 100,
                                                child: Image.asset(
                                                  'lib/images/logo_3.png',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text('Paga Alla Cassa'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                // Bottone Annulla l'ordine

                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: FaIcon(
                                    FontAwesomeIcons.xmark,
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            )),
                      ),
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
