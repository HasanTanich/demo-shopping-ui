import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_app_ui/models/employee.dart';
import 'package:shopping_app_ui/services/employee_services.dart';
import 'package:shopping_app_ui/widgets/navigation_bar.dart';

final _formKey = GlobalKey<FormState>();

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Map<String, dynamic>> formFields = [
    {
      'name': 'name',
      'label': 'Name',
      'value': '',
      'validator': (value) {
        if (value.isEmpty) {
          return 'Enter name please';
        }
        return null;
      }
    },
    {
      'name': 'age',
      'label': 'Age',
      'value': null,
      'validator': (value) {
        if (value.isEmpty) {
          return 'Please enter age';
        } else if (int.parse(value) > 100) {
          return 'Please enter a valid age number';
        }
        return null;
      }
    },
    {
      'name': 'salary',
      'label': 'Salary',
      'value': null,
      'validator': (value) {
        if (value.isEmpty) {
          return 'Please enter salary';
        }
        return null;
      }
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Favorites Page"),
      ),
      body: Center(
        child: Column(
          children: [
            Form(
              key: _formKey,
              onChanged: () {
                setState(() {
                  Form.of(primaryFocus!.context!).save();
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: formFields
                    .map(
                      (item) => Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          keyboardType: item['name'] != 'name'
                              ? TextInputType.number
                              : TextInputType.text,
                          inputFormatters: item['name'] != 'name'
                              ? <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ]
                              : null,
                          validator: item['validator'],
                          onSaved: (value) {
                            if (value != null) {
                              item['value'] = value;
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: item['label'],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  int ageValue = int.parse(formFields[1]['value']);
                  int salaryValue = int.parse(formFields[2]['value']);
                  var data = Employee(
                      name: formFields[0]['value'],
                      age: ageValue,
                      salary: salaryValue);
                  final result =
                      await EmployeeServices.createEmployee(data: data);
                  final BuildContext context = this.context;

                  if (result) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Successfully created employee')));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Failed, please try again later')));
                  }
                }
              },
              child: const Text('Create user'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MyNavigationBar(),
    );
  }
}
