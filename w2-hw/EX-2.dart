class BankAccount {
  final int _id;
  final String _owner;
  double _balance = 0;

  BankAccount(this._id, this._owner);

  int get id => _id;
  String get owner => _owner;

  double get balance => _balance;

  void withdraw(double amount) {
    if (_balance-amount<0) {
      throw Exception("Insufficient account balance");
    }
    _balance -= amount;
  }

  void credit(double amount) {
    _balance+=amount;
  }
}

class Bank {
  final String _name;
  final List<BankAccount> _accounts = [];

  Bank({required String name}):_name=name;

  String get name => _name;

  BankAccount createAccount(int id, String owner) {
    for (BankAccount account in _accounts) {
      if (account.id==id) {
        throw Exception("This account with id $id already exists twin");
      }
    }

    BankAccount newAccount = BankAccount(id, owner);
    _accounts.add(newAccount);
    return newAccount;
  }
}
 
void main() {

  Bank myBank = Bank(name: "cuh Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
