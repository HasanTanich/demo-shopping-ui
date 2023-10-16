class Employee {
  final String name;
  final int age;
  final int salary;

  Employee({required this.name, required this.age, required this.salary});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'salary': salary,
    };
  }
}
