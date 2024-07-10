import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

// ignore: must_be_immutable
class CaroselloImmagini extends StatelessWidget {
  CaroselloImmagini({super.key});
  List imgList = [
    'lib/images/pexels-roman-odintsov-5061254.jpg',
    'lib/images/pexels-ehioma-osih-109764575-11743997.jpg',
    'lib/images/pexels-david-disponett-1118410-16560504.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.height * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: FlutterCarousel(
                    options: CarouselOptions(
                      physics: NeverScrollableScrollPhysics(),
                      showIndicator: false,
                      floatingIndicator: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      disableCenter: true,
                      enableInfiniteScroll: true,
                      viewportFraction: 1,
                      slideIndicator: CircularSlideIndicator(),
                    ),
                    items: imgList
                        .map(
                          (item) => Center(
                              child: Image.network(
                            item,
                            fit: BoxFit.cover,
                          )),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
