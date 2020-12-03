class Products {
  final int id;
  final String name;
  final String image;
  final int quantity;
  final String price;

  Products({this.id, this.name, this.image, this.quantity, this.price});

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        quantity: json['quantity'],
        price: json['price']
    );
  }
}