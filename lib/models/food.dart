class Food {
  String name;
  String price;
  String imagePath;
  String ratings;
  
  Food({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.ratings,
  });
  String get _name => name;
  String get _price => price;
  String get _imagePath => imagePath;
  String get _ratings => ratings;
}