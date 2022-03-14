class WasteEntryDTO {
  
  late String date;
  late String imgURL;
  late String latitude;
  late String longitude;
  late int quantity;

  WasteEntryDTO({
    required this.date, 
    required this.imgURL, 
    required this.latitude, 
    required this.longitude,
    required this.quantity,
  });
  
  @override
  String toString() {
    return "Date: $date, imgURL: $imgURL, Latitude: $latitude, Longitude: $longitude, Quantity: $quantity";
  }
}