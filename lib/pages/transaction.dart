import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _formKey = GlobalKey<FormState>();
  bool _isRecurring = false;
  String _transactionType = 'Expense';
  DateTime _selectedDate = DateTime.now();

  // void _pickDate() async {
  //   DateTime? date = await showDatePicker(
  //     context: context,
  //     initialDate: _selectedDate,
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2101),
  //   );
  //   if (date != null) {
  //     setState(() {
  //       _selectedDate = date;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Transaction'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '17,99€',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Center(
                child: ToggleButtons(
                  isSelected: [
                    _transactionType == 'Expense',
                    _transactionType == 'Income',
                    _transactionType == 'Investment'
                  ],
                  onPressed: (int index) {
                    setState(() {
                      if (index == 0) {
                        _transactionType = 'Expense';
                      } else if (index == 1) {
                        _transactionType = 'Income';
                      } else if (index == 2) {
                        _transactionType = 'Investment';
                      }
                    });
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Expense'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Income'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Investment'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              DatePickerWidget(),
              SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 239, 239, 239),
                    border: OutlineInputBorder(),
                    hintText: 'Title',
                  ),
                ),
              ),
              // TextFormField(
              //   decoration: InputDecoration(
              //     labelText: 'Description',
              //   ),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter a description';
              //     }
              //     return null;
              //   },
              // ),
              SizedBox(height: 16),
              // DropdownButtonFormField<String>(
              //   decoration: InputDecoration(
              //     labelText: 'Category',
              //   ),
              //   items: <String>['Category 1', 'Category 2', 'Category 3']
              //       .map((String value) {
              //     return DropdownMenuItem<String>(
              //       value: value,
              //       child: Text(value),
              //     );
              //   }).toList(),
              //   onChanged: (_) {},
              // ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 239, 239, 239),
                    border: OutlineInputBorder(),
                    hintText: 'Description',
                  ),
                ),
              ),
              SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 239, 239, 239),
                    border: OutlineInputBorder(),
                    hintText: 'Account',
                  ),
                ),
              ),
              SizedBox(height: 16),
              SwitchListTile(
                title: Text('Add as recurring'),
                subtitle: Text(
                    'This transaction will be added again the following months at the same day as today'),
                value: _isRecurring,
                onChanged: (bool value) {
                  setState(() {
                    _isRecurring = value;
                  });
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Transaction Added')),
                    );
                  }
                },
                child: Text('Add Transaction'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DatePickerWidget extends StatefulWidget {
  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime _selectedDate = DateTime.now();
  String get _formattedDate {
    final now = DateTime.now();
    final dateFormatter = DateFormat.yMd();
    return dateFormatter.format(_selectedDate) == dateFormatter.format(now)
        ? 'Today'
        : DateFormat('dd/MM/yyyy').format(_selectedDate);
  }

  void _pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (date != null && date != _selectedDate) {
      setState(() {
        _selectedDate = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Date',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              Text(
                _formattedDate,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: _pickDate,
          ),
        ],
      ),
    );
  }
}
