import 'package:basic_flutter_dicoding/detail_screen.dart';
import 'package:basic_flutter_dicoding/model/tourism_place.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wisata Bandung"),
      ),
      body: ListView.builder(
          itemBuilder: (BuildContext context, int index){
            final TourismPlace place = tourismPlaceList[index];

            return InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return DetailScreen(places: place);
                      }));
                },
                child: Card(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Hero(tag: place.tag, child: Image.asset(place.imageAsset))),
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  place.name,
                                  style: const TextStyle(fontSize: 16.0),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(place.location)
                              ],
                            ),
                          ))
                    ],
                  ),
                ));
          },
        itemCount: tourismPlaceList.length,
      ),
    );
  }
}
