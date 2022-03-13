import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NewEntryForm extends StatefulWidget {

  final String url;

  const NewEntryForm({ Key? key, required this.url }) : super(key: key);

  @override
  State<NewEntryForm> createState() => _NewEntryFormState();
}

class _NewEntryFormState extends State<NewEntryForm> {

  final formKey = GlobalKey<FormState>();
  int quantity = 0;
  String title = '';

  @override
  Widget build(BuildContext context) {
    return newEntryForm(context);
  }

  Widget newEntryForm(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            wasteImage(context),
            const SizedBox(height: 10),
            itemNumberEntry(),
            const SizedBox(height: 10),
            uploadButton()
          ]
        ),
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
            child: Image.network(widget.url, fit: BoxFit.cover,)
          )
        ),
      ],
    );
  }

  Widget itemNumberEntry(){
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter the number of items',
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly
            ],
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter number of items';
              } else if (double.tryParse(value) == null){
                return 'Please enter a valid number';
              } else {
                return null;
              }
            },
            onSaved: (value) {
              quantity = int.parse(value!);
            },
          )
        ),
      ],
    );
  }

  
  Widget uploadButton() {
    return ElevatedButton(
      child: const Text('Upload data'),
       onPressed: () async {
        if (formKey.currentState!.validate()) {
          title = DateFormat.yMMMMEEEEd().format(DateTime.now()).toString();
          formKey.currentState!.save();
          uploadData();
          Navigator.restorablePopAndPushNamed(context, '/');
        }
      },
    );
  }

  void uploadData() {
     FirebaseFirestore.instance
        .collection('posts')
        .add({'title': title, 'quantity': quantity, 'imageURL': widget.url});
  }
}