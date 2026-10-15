enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String _street;
  final String _city;
  final int _zipCode;

  const Address(this._street, this._city, this._zipCode);

  String get street => _street;
  String get city => _city;
  int get zipCode => _zipCode;

  @override
  String toString() => '$_street, $_city, $_zipCode';
}

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;

  Employee(this._name, this._baseSalary, this._skills, this._address, this._yearsOfExperience);

  Employee.mobileDeveloper(String name, Address address, {double baseSalary=20000, int yearsOfExperience=0})
  : _name = name,
  _baseSalary = baseSalary,
  _skills = [Skill.DART, Skill.FLUTTER],
  _address = address,
  _yearsOfExperience = yearsOfExperience;

  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => List.unmodifiable(_skills);
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  double computeSalary() {
    double salary=_baseSalary+_yearsOfExperience*1000;
    for (final skill in _skills) {
      if (skill == Skill.FLUTTER) {
        salary +=5000;
      } else if (skill==Skill.DART) {
        salary+=3000;
      } else if (skill==Skill.OTHER) {
        salary+=1000;
      }
    }
    return salary;
  }

  void printDetails() {
    print('Employee: $_name, Address: $_address, Experience: $_yearsOfExperience, Skills: ${_skills.map((e) => e.name).join(', ')}, Salary: ${computeSalary()}');
  }
}

void main() {
  const address = Address("son", "croatia", 2);

  var emp1 = Employee.mobileDeveloper("joe mama", address, yearsOfExperience: 3);
  var emp2 = Employee("clinton", 20000, [Skill.DART, Skill.OTHER], address, 1);

  emp1.printDetails();
  emp2.printDetails();
}