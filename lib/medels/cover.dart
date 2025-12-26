
// ignore_for_file: camel_case_types

class cover {
  String image;
  String name;
  cover({required this.image, required this.name});
  static List<cover> covers = [
    cover(image: "images/collections/winter_collection.jpg", name: "winter collection"),
    cover(image: "images/collections/summer_collerction.jpg", name: "summer collerction"),
    cover(image: "images/collections/autumn_collection.jpg", name: "autumn collection "),
    cover(image: "images/collections/spring_collection.jpg", name: " spring collection"),
  ];
}
