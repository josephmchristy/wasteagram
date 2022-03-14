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
      stream: FirebaseFirestore.instance.collection('posts').snapshots(),
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
                                  title: post['title'], 
                                  imgURL: post['imageURL'], 
                                  latitude: 'ex', 
                                  longitude: 'ex', 
                                  quantity: post['quantity']
                                )
                              )
                            )
                          );
                        },
                        trailing: Text(post['quantity'].toString()),
                        title: Text(post['title']));
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