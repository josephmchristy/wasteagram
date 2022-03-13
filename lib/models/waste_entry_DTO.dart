class WasteEntryDTO {
  
  late String title;
  late String imgURL;
  late String latitude;
  late String longitude;
  late int quantity;

  WasteEntryDTO({
    required this.title, 
    required this.imgURL, 
    required this.latitude, 
    required this.longitude,
    required this.quantity
  });
  
  @override
  String toString() {
    return "Title: $title, imgURL: $imgURL, Latitude: $latitude, Longitude: $longitude, Quantity: $quantity";
  }
}