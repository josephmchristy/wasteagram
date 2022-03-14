import 'package:flutter/material.dart';
import 'package:wasteagram/models/waste_entry_DTO.dart';
import 'package:wasteagram/widgets/app_scaffold.dart';
import 'package:wasteagram/widgets/entry_view.dart';

class EntryViewScreen extends StatelessWidget {

  WasteEntryDTO wasteEntryDTO;
  
  EntryViewScreen({ Key? key, required this.wasteEntryDTO }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(title: wasteEntryDTO.date, screen: EntryView(wasteEntryDTO: wasteEntryDTO));
  }
}