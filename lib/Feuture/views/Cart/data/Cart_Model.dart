// ignore: camel_case_types
class cartModel {
  String? image;
  String? title;
  String? price;
  String? userid;

  cartModel(
      {required this.image,
      required this.title,
      required this.price,
      required this.userid});

  cartModel.fromjson({required Map<String, dynamic> data}) {
    image = data['image'];
    title = data['title'];
    price = data['price'];
    userid = data['userid'];
  }

  Map<String, dynamic> tojson() {
    return {
      'image': image,
      'title': title,
      'price': price,
      'userid': userid,
    };
  }
}
