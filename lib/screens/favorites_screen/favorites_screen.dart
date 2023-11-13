import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/helpers/helper_functions.dart';
import '/models/employee.dart';
import '/services/employee_services.dart';
import '/widgets/navigation_bar.dart';
import 'widgets/my_text_form_field.dart';

final _formKey = GlobalKey<FormState>();

class FavoritesScreen extends StatefulWidget {
  // text controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();

  FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    var validatorFunctions = {
      'name': (String? value) {
        if (value!.isEmpty) {
          return 'Enter name please';
        }
        return null;
      },
      'age': (String? value) {
        if (value!.isEmpty) {
          return 'Please enter age';
        } else if (int.parse(value) > 100) {
          return 'Please enter a valid age number';
        }
        return null;
      },
      'salary': (String? value) {
        if (value!.isEmpty) {
          return 'Please enter salary';
        }
        return null;
      },
    };
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
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  MyTextFormField(
                    hintText: 'Name',
                    controller: widget.nameController,
                    validator: validatorFunctions['name'],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextFormField(
                    hintText: 'Age',
                    controller: widget.ageController,
                    validator: validatorFunctions['age'],
                    inputType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextFormField(
                    hintText: 'Salary',
                    controller: widget.salaryController,
                    validator: validatorFunctions['salary'],
                    inputType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  )
                ]),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  int ageValue = int.parse(widget.ageController.text);
                  int salaryValue = int.parse(widget.salaryController.text);
                  var data = Employee(
                      name: widget.nameController.text,
                      age: ageValue,
                      salary: salaryValue);
                  final result =
                      await EmployeeServices.createEmployee(data: data);

                  if (result) {
                    // ignore: use_build_context_synchronously
                    displayMessageToUser("Success", context);
                  } else {
                    // ignore: use_build_context_synchronously
                    displayMessageToUser("Failure", context);
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
