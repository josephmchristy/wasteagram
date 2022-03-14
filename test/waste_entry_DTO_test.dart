import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:wasteagram/models/waste_entry_DTO.dart';

void main() {
  test('DTO should have properly initialized values', () {
    final date = DateFormat.yMMMMEEEEd().format(DateTime.now()).toString();
    const imgURL = 'www.google.com';
    const quantity = 1;
    const latitude = '1.0';
    const longitude = '2.0';

    final wasteEntryDto = WasteEntryDTO(
      date: date, 
      imgURL: imgURL, 
      latitude: latitude, 
      longitude: longitude, 
      quantity: quantity,
    );

    expect(wasteEntryDto.date, date);
    expect(wasteEntryDto.imgURL, imgURL);
    expect(wasteEntryDto.latitude, latitude);
    expect(wasteEntryDto.longitude, longitude);
    expect(wasteEntryDto.quantity, quantity);

    expect(wasteEntryDto.toString(), "Date: $date, imgURL: $imgURL, Latitude: $latitude, Longitude: $longitude, Quantity: $quantity");
  });

  test('DTO toString() prints correct values', () {
    final date = DateFormat.yMMMMEEEEd().format(DateTime.now()).toString();
    const imgURL = 'www.google.com';
    const quantity = 1;
    const latitude = '1.0';
    const longitude = '2.0';

    final wasteEntryDto = WasteEntryDTO(
      date: date, 
      imgURL: imgURL, 
      latitude: latitude, 
      longitude: longitude, 
      quantity: quantity,
    );

    expect(wasteEntryDto.toString(), "Date: $date, imgURL: $imgURL, Latitude: $latitude, Longitude: $longitude, Quantity: $quantity");
  });
}