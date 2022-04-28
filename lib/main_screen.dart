import 'package:basic_flutter_dicoding/detail_screen.dart';
import 'package:basic_flutter_dicoding/model/tourism_place.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            // Use MediaQuery to get browser/device width
            // Text("Wisata Bandung (Size: ${MediaQuery.of(context).size.width})"),
            const Text("Wisata Bandung"),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraint) {
        if (constraint.maxWidth <= 600) {
          return const TourismPlaceList();
        } else if (constraint.maxWidth <= 1200) {
          return const TourismPlaceGrid(
            gridCount: 4,
          );
        } else {
          return const TourismPlaceGrid(
            gridCount: 6,
          );
        }
      }),
    );
  }
}

class TourismPlaceList extends StatelessWidget {
  const TourismPlaceList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
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
                      child: Hero(
                          tag: place.tag,
                          child: Image.asset(place.imageAsset))),
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
                              style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Oxygen"),
                            ),
                            const SizedBox(
                              height: 10.0,
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
    );
  }
}

class TourismPlaceGrid extends StatelessWidget {
  final int gridCount;

  const TourismPlaceGrid({Key? key, required this.gridCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        isAlwaysShown: true,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: GridView.count(
            crossAxisCount: gridCount,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
            children: tourismPlaceList.map((place) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailScreen(places: place);
                  }));
                },
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                          child: Hero(
                              tag: place.tag,
                              child: Image.asset(
                                place.imageAsset,
                                fit: BoxFit.cover,
                              ))),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          place.name,
                          style: const TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                        child: Text(place.location),
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ));
  }
}
