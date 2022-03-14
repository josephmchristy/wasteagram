import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasteagram/models/waste_entry_DTO.dart';
import 'package:wasteagram/screens/entry_view_screen.dart';
import 'package:wasteagram/widgets/select_image_button.dart';

class EntryList extends StatelessWidget {

  const EntryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
        .collection('posts')
        .orderBy('timestamp', descending: true)
        .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData &&
            snapshot.data!.docs.isNotEmpty) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var post = snapshot.data!.docs[index];
                    return ListTile(
                        onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => EntryViewScreen(
                                wasteEntryDTO: WasteEntryDTO(
                                  date: post['date'], 
                                  imgURL: post['imageURL'], 
                                  latitude: post['latitude'].toString(), 
                                  longitude: post['longitude'].toString(), 
                                  quantity: post['quantity'],
                                  //timestamp: DateTime.parse(post['timestamp'].toDate().toString())
                                )
                              )
                            )
                          );
                        },
                        trailing: Text(post['quantity'].toString()),
                        title: Text(post['date']));
                  },
                ),
              ),
              const SelectImageButton()
            ],
          );
        } else {
          return Column(
            children: const [
              Center(child: CircularProgressIndicator()),
              SelectImageButton()
            ],
          );
        }
      }
    );
  }
}