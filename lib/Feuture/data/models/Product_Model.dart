class productModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;
  final RatingModel rating;
  productModel(
      {required this.id,
      required this.rating,
      required this.title,
      required this.price,
      required this.description,
      required this.image});

  factory productModel.fromjcon(jcondata) {
    return productModel(
        id: jcondata['id'],
        title: jcondata['title'],
        price: jcondata['price'],
        description: jcondata['description'],
        image: jcondata['image'],
        rating: RatingModel.fromjcon(jcondata['rating']));
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromjcon(jcondata) {
    return RatingModel(rate: jcondata['rate'], count: jcondata['count']);
  }
}
