import 'package:flutter/material.dart';
import 'package:wasteagram/models/waste_entry_DTO.dart';

class EntryView extends StatelessWidget {

  late WasteEntryDTO wasteEntryDTO;

  EntryView({ Key? key, required this.wasteEntryDTO }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text(wasteEntryDTO.date),
          const SizedBox(height: 10),
          Semantics(
            enabled: true,
            label: 'Image of {$wasteEntryDTO.date}',
            child: wasteImage(context)
          ),
          const SizedBox(height: 10),
          Text('Quantity: ${wasteEntryDTO.quantity}'),
          const SizedBox(height: 10),
          Text('Latitude: ${wasteEntryDTO.latitude} Longitude: ${wasteEntryDTO.longitude}')
        ]
      ),
    );
  }

  Widget wasteImage(BuildContext context){
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: MediaQuery.of(context).size.height/3,
            child: Image.network(wasteEntryDTO.imgURL, fit: BoxFit.cover,)
          )
        ),
      ],
    );
  }
}