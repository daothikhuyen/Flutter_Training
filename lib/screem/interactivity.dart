import 'package:flutter/material.dart';
import 'package:flutter_practice/widget/favorite_widget.dart';

class Interactivity extends StatefulWidget {
  const Interactivity({super.key});

  @override
  State<Interactivity> createState() => _InteractivityState();
}

class _InteractivityState extends State<Interactivity> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Image.asset(
              'assets/images/lake.jpg',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            // flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Alica Bill Tion lake Campground',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Tam Ky, Quang Nam',
                        style: TextStyle(
                          color: Colors.black12,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: FavoriteWidget()),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(Icons.call, color: Colors.blueAccent),
                  Text(
                    'CALL',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.route, color: Colors.blueAccent),
                  Text(
                    'ROUTE',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.share, color: Colors.blueAccent),
                  Text(
                    'SHARE',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                'The name Hoan Kiem officially appeared in the early 15th century, associated with the legend of King Le Thai To returning the sacred sword to the Divine Turtle after borrowing it to fight, defeat the Ming invaders, officially becoming king and establishing the prosperous Le dynasty.' +
                    'Legend has it that when Le Loi rose up to lead the Lam Son uprising in Thanh Hoa against the Ming army, he accidentally captured the Thuan Thien sword. Thanks to this sacred sword, he won consecutive battles and ascended the throne in early 1428.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
