import 'package:flutter/material.dart';
import 'package:wasteagram/widgets/app_scaffold.dart';

import '../widgets/entry_list.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(screen: EntryList());
  }
}