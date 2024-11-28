import 'package:flutter/material.dart';

class BookCoverSection extends StatelessWidget {
  final dynamic bookData;

  const BookCoverSection({Key? key, this.bookData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: const EdgeInsets.all(25.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              bookData?.frontCover ?? '',
              width: 150,
              height: 200,
              fit: BoxFit.fitHeight,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bookData?.nepaliTitle ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  bookData?.authors?.map((author) => author.name).join(', ') ??
                      '',
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(70, 33, 177, 243),
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {},
                  child: Text(
                    bookData?.categories?[0].name ?? '',
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
