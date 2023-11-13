import 'package:flutter/material.dart';

import '/services/employee_services.dart';
import '/widgets/navigation_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Profile Page"),
      ),
      body: Center(
        child: FutureBuilder<dynamic>(
          future: EmployeeServices.getEmployees(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // Show a loading spinner while waiting
            } else if (snapshot.hasError) {
              return Text(
                  'Error: ${snapshot.error}'); // Show error message if something went wrong
            } else {
              return ListView(
                children: snapshot.data
                    .map<Widget>(
                      (item) => ListTile(
                        leading: Text(item['id'].toString()),
                        title: Text(item['employee_name']),
                        trailing: Text(item['employee_salary'].toString()),
                      ),
                    )
                    .toList(),
              );
            }
          },
        ),
      ),
      bottomNavigationBar: const MyNavigationBar(),
    );
  }
}
