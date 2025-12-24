
class Product {
  final String image;
  final String name;
  final String price;
  final String description;
  Product({
    required this.image,
    required this.name,
    required this.price,
    required this.description,
  });
   static List<Product> products = [
    Product(
      image: "images/images1.jpg",
      name: "fersimages",
      price: "100",
      description: "old money clothes brand ",
    ),
    Product(
      image: "images/images2.jpg",
      name: "secondimages",
      price: "80",
      description: "entica clothes brand ",
    ),
    Product(
    image: "images/images3.jpg",
    name: "therdimages",
    price: "50",
    description: "top gerls clothes brand ",
    ),
    Product(
    image: "images/images1.jpg",
    name: "fordimages",
    price: "120",
    description: "children  clothes brand ",
    ),
  ];
}