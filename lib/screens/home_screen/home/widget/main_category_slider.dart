import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CategorySlider extends StatelessWidget {
  const CategorySlider({
    super.key,
    required this.sliderData,
  });

  final List<Map> sliderData;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: 300.0,
          autoPlay: true,
          autoPlayAnimationDuration: const Duration(seconds: 3)),
      items: sliderData.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xff000000), Color(0xff000000)],
                      stops: [0, 1],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                    image: DecorationImage(
                        image: NetworkImage(i[2]),
                        opacity: 0.5,
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Stack(alignment: Alignment.bottomLeft, children: [
                    Text(
                      "${i[1]}",
                      style: const TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ]),
                ));
          },
        );
      }).toList(),
    );
  }
}
