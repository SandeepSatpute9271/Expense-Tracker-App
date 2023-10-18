import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  // widget class
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // state class

  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  final _categoryController = TextEditingController();

  DateTime? _selectDate;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredCategory = _categoryController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (_amountController.text.isEmpty || _categoryController.text.isEmpty) {
      return;
    }

    if (enteredTitle.isEmpty || enteredAmount <= 0 || enteredCategory.isEmpty || _selectDate == null) {
      return;
    }
    // used to access the data of widget class
    widget.addTx(
      enteredTitle,
      enteredCategory,
      enteredAmount,
      _selectDate,
    );

    Navigator.of(context).pop(); // used to close the model sheet
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    ).then(
      (pickedDate) {
        if (pickedDate == null) {
          return;
        }

        setState(() {
          _selectDate = pickedDate;
        });
      },
    );

    // print('...');
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
              TextField(
                decoration: const InputDecoration(labelText: 'Name/Item'),
                controller: _titleController,
                onSubmitted: (_) {
                  _submitData();
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) {
                  _submitData();
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Category'),
                controller: _categoryController,
                onSubmitted: (_) {
                  _submitData();
                },
              ),
              SizedBox(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectDate == null
                            ? 'Select date'
                            : 'Date : ${DateFormat.yMd().format(_selectDate!)}',
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: _presentDatePicker,
                      child: const Text('Choose date'),
                    ),
                  ],
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
                  'Add Expense',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
