import 'package:basic_flutter_dicoding/model/tourism_place.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final TourismPlace places;

  const DetailScreen({Key? key, required this.places}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraint) {
      if (constraint.maxWidth > 600) {
        return DetailWebPage(place: places);
      } else {
        return DetailMobilePage(place: places);
      }
    });
  }
}

class DetailWebPage extends StatefulWidget {
  final TourismPlace place;

  const DetailWebPage({Key? key, required this.place}) : super(key: key);

  @override
  State<DetailWebPage> createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 64.0),
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          width: 1000,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Wisata Bandung",
                style: TextStyle(fontFamily: 'Staatliches', fontSize: 32.0),
              ),
              const SizedBox(
                height: 32.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      ClipRRect(
                        child: Hero(
                            tag: widget.place.tag,
                            child: Image.asset(widget.place.imageAsset)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Scrollbar(
                          isAlwaysShown: true,
                          controller: _scrollController,
                          child: Container(
                            height: 150.0,
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: ListView(
                              controller: _scrollController,
                              scrollDirection: Axis.horizontal,
                              children: widget.place.imageUrls.map((url) {
                                return Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.network(url),
                                  ),
                                );
                              }).toList(),
                            ),
                          ))
                    ],
                  )),
                  const SizedBox(
                    width: 32.0,
                  ),
                  Expanded(
                      child: Card(
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              widget.place.name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontFamily: 'Staatliches', fontSize: 30.0),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.calendar_today),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    widget.place.openDays,
                                    style: informationTextStyle,
                                  )
                                ],
                              ),
                              const FavoriteButton(),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.access_time),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                widget.place.openTime,
                                style: informationTextStyle,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.monetization_on),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                widget.place.ticketPrice,
                                style: informationTextStyle,
                              )
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Text(
                              widget.place.description,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                  fontSize: 16.0, fontFamily: 'Oxygen'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class DetailMobilePage extends StatelessWidget {
  final TourismPlace place;

  const DetailMobilePage({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Hero(tag: place.tag, child: Image.asset(place.imageAsset)),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            )),
                      ),
                      const FavoriteButton()
                    ],
                  ))
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 16.0),
            child: Text(
              place.name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 30.0, fontFamily: 'Staatliches'),
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
                      place.openDays,
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
                      place.openTime,
                      style: informationTextStyle,
                    )
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.monetization_on),
                    const SizedBox(height: 8.0),
                    Text(
                      place.ticketPrice,
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
              place.description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16.0, fontFamily: 'Oxygen'),
            ),
          ),
          Container(
              height: 150.0,
              margin: const EdgeInsets.only(bottom: 32.0),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: place.imageUrls.map((index) {
                    return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(index)));
                  }).toList()))
        ],
      )),
    ));
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ));
  }
}
