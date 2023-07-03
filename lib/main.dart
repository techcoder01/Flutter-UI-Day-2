import 'package:day2/FadeAnimation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
    theme: ThemeData(
      fontFamily: "Roboto"
    ),
    debugShowCheckedModeBanner: false,
    home: const HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
 late PageController pageController ;

void _onScroll() {
}


@override
void initState() {
  pageController = PageController(
    initialPage: 0,
  )..addListener(() {
      _onScroll();
    });
  super.initState();
}

@override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
           makePage(
            page: 1,
            image: 'assets/images/one.jpg',
            title: 'Yosemite National Park',
            description: 'Yosemite National Park is in California’s Sierra Nevada mountains. It’s famed for its giant, ancient sequoia trees, and for Tunnel View, the iconic vista of towering Bridalveil Fall and the granite cliffs of El Capitan and Half Dome.',
            rating: 4,
            totalRatings: 22300,
          ),
          makePage(
            page: 2,
            image: 'assets/images/two.jpg',
            title: 'Golden Gate Bridge',
            description: 'The Golden Gate Bridge is a suspension bridge spanning the Golden Gate, the one-mile-wide strait connecting San Francisco Bay and the Pacific Ocean.',
                        rating: 3,
            totalRatings: 22001,
          ),
          makePage(
            page: 3,
            image: 'assets/images/three.jpg',
            title: 'Sedona',
            description: "Sedona is regularly described as one of America's most beautiful places. Nowhere else will you find a landscape as dramatically colorful.",
                                    rating: 4,
            totalRatings: 22509,
          ),
          makePage(
            page: 4,
            image: 'assets/images/four.jpg',
            title: 'Savannah',
            description: "Savannah, with its Spanish moss, Southern accents and creepy graveyards, is a lot like Charleston, South Carolina. But this city about 100 miles to the south has an eccentric streak.",
                                    rating: 5,
            totalRatings: 21001,
          ),
        ],
      ),
    );
  }
}

Widget makePage({image, title, description, page , rating , totalRatings }){
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage(image),fit: BoxFit.cover),
    ),
    child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            stops: const [0.3 , 0.9],
            colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.2),
            ]
            ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 40,),
               Row(
                mainAxisAlignment: MainAxisAlignment.end,
                textBaseline: TextBaseline.alphabetic,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                   FadeAnimation(2, Text('$page', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)),
                   const Text('/4', style: TextStyle(color: Colors.white, fontSize: 15),),

                ],
              ),
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    FadeAnimation(1, Text(title, style: TextStyle(color: Colors.white, fontSize: 45, fontWeight: FontWeight.bold),)),
                    const SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                      1.5 , Row(
                        children: [
                           RatingRow(rating: rating, totalRatings: totalRatings),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                      FadeAnimation(
                        2, Padding(
                          padding: const EdgeInsets.only(right: 40),
                          child: Text(description, style: TextStyle(color: Colors.white.withOpacity(.7), fontSize: 15, height: 1.9),),
                        ),
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                      FadeAnimation(2.5, const Text('READ MORE', style: TextStyle(color: Colors.white),)),                      
                                          const SizedBox(
                      height: 30,
                    ),
                ],
              ))
            ],
          ),
        ),
      ),
  );
}


class Star extends StatelessWidget {
  final Color color;

  const Star(this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star,
      color: color,
      size: 24,
    );
  }
}

class RatingRow extends StatelessWidget {
  final int rating;
  final int totalRatings;

  const RatingRow({super.key, required this.rating, required this.totalRatings});

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [];
    for (int i = 0; i < rating; i++) {
      stars.add(const Star(Colors.yellow));
    }
    for (int i = rating; i < 5; i++) {
      stars.add(const Star(Colors.grey));
    }

    return Row(
      children: [
        ...stars,
        Text(
          '$rating',
          style: const TextStyle(color: Colors.white70),
        ),
        Text(
          '($totalRatings)',
          style: const TextStyle(color: Colors.white38, fontSize: 12),
        ),
      ],
    );
  }
}
