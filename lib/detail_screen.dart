import 'package:basic_flutter_dicoding/model/tourism_place.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final TourismPlace places;
  const DetailScreen({Key? key, required this.places}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');

    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(tag: places.tag, child: Image.asset(places.imageAsset)),
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: Text(
                  places.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 30.0, fontFamily: 'Staatliches'),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Icon(Icons.calendar_today),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          places.openDays,
                          style: informationTextStyle,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(Icons.access_time),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          places.openTime,
                          style: informationTextStyle,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(Icons.monetization_on),
                        const SizedBox(height: 8.0),
                        Text(
                          places.ticketPrice,
                          style: informationTextStyle,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  places.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16.0, fontFamily: 'Oxygen'),
                ),
              ),
              Container(
                  height: 150,
                  margin: const EdgeInsets.only(bottom: 32.0),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: places.imageUrls.map((index) {
                        return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(index)));
                      }).toList())
              )
            ],
          )),
        ));
  }
}
