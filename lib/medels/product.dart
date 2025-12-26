
class Product {
  final String image;
  final String name;
   String price;
  final String description;
   int qty=1;
  Product({
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    required this.qty,

  });
   static List<Product> products = [
    Product(
      image: "images/old_money/images1.jpg",
      name: "fersimages",
      price: "100",
      description: "old money clothes brand ",
      qty:1,
    ),
    Product(
      image: "images/old_money/images2.jpg",
      name: "secondimages",
      price: "80",
      description: "entica clothes brand ",
      qty:1,
    ),
    Product(
    image: "images/old_money/images3.jpg",
    name: "therdimages",
    price: "50",
    description: "top gerls clothes brand ",
    qty:1,
    ),
    Product(
    image: "images/old_money/images1.jpg",
    name: "fordimages",
    price: "120",
    description: "children  clothes brand ",
    qty:1,
    ),
  ];
}