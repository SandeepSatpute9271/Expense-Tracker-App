import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ManageCategory extends StatefulWidget {
  // widget class
  final Function addTx;

  const ManageCategory(this.addTx, {super.key});

  @override
  State<ManageCategory> createState() => _NewCategoryState();
}

class _NewCategoryState extends State<ManageCategory> {
  // state class

  final _titleController = TextEditingController();

  void _submitData() {
    final enteredTitle = _titleController.text;

    if (enteredTitle.isEmpty) {
      return;
    }
    // used to access the data of widget class
    widget.addTx(
      enteredTitle,
    );

    Navigator.of(context).pop(); // used to close the model sheet
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),

          // padding: MediaQuery.of(context).viewInsets,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 10,
                width: 50,
                child: Image.asset(
                  'assets/images/dash.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 70,
                child: TextField(
                  decoration: const InputDecoration(labelText: 'Category Name'),
                  controller: _titleController,
                  onSubmitted: (_) {
                    _submitData();
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _submitData();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColorDark,
                ),
                child: const Text(
                  'Add Category',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
