import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final double rating;
  final bool isLiked;
  final String title;
  final String image;
  final String subtitle;
  final double price;

  const HomeCard(
      {required this.rating,
      required this.isLiked,
      required this.title,
      required this.image,
      required this.subtitle,
      required this.price,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: MediaQuery.of(context).size.width * 0.456,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(rating.toString()),
              isLiked
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_border_outlined),
            ],
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              height: 24 / 16,
              color: Colors.black,
            ),
          ),
          Image.network(image),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 12.0,
              height: 20 / 14,
              color: Colors.grey.shade800,
            ),
          ),
          SizedBox(
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price.toString(),
                  style: const TextStyle(
                    fontSize: 16.0,
                    height: 24 / 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    debugPrint("hello there!");
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.blue.shade100),
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 10.0,
                      height: 24 / 16,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
