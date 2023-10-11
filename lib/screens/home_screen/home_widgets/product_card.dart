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
      width: MediaQuery.of(context).size.width * 0.45,
      padding: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(rating.toString()),
                GestureDetector(
                  onTap: () {
                    debugPrint("Hello~!");
                  },
                  child: (isLiked
                      ? const Icon(Icons.favorite)
                      : const Icon(Icons.favorite_border_outlined)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.18,
            width: MediaQuery.of(context).size.width * 1,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  image,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            height: 26,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                height: 20 / 16,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 38,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12.0,
                  height: 20 / 14,
                  color: Colors.grey.shade800,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$$price',
                  style: const TextStyle(
                    fontSize: 16.0,
                    height: 24 / 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  width: 60,
                  child: OutlinedButton(
                    onPressed: () {
                      debugPrint("hello there!");
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.blue.shade100),
                      side: MaterialStateProperty.all(BorderSide.none),
                      padding: const MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 2, vertical: 2)),
                    ),
                    child: const Text(
                      'Add',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
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
