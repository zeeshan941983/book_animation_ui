class Book {
  const Book({
    required this.title,
    required this.author,
    required this.image,
    required this.price,
  });

  final String title;

  final String author;

  final String image;
  final String price;
}

const _bookAssets = "assets/";

const List<Book> books = [
  Book(
    title: "We Dream of space",
    author: "Erin Killy",
    image: "$_bookAssets/book1.jpg",
    price: '\$10',
  ),
  Book(
    title: "Dead Voices",
    author: "Ardy",
    image: "$_bookAssets/book2.jpg",
    price: '\$20',
  ),
  Book(
    title: "After the worse thing happens",
    author: "Audary vernicks",
    image: "$_bookAssets/book3.jpg",
    price: '\$30',
  ),
  Book(
    title: "What happend after midnight",
    author: "K.L Walter",
    image: "$_bookAssets/book4.jpg",
    price: '\$40',
  ),
  Book(
    title: "Beauty of Nature",
    author: "Marry Tom",
    image: "$_bookAssets/book8.jpg",
    price: '\$80',
  ),
];
