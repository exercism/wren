// export class BankAccount {
//   open() {
//     if (this._open) {
//       throw new ValueError_();
//     }
//     this._open = true;
//     this._balance = 0;
//   }

//   close() {
//     this.verifyAccount();
//     this._open = false;
//   }

//   verifyAccount() {
//     if (!this.isOpen) {
//       throw new ValueError_();
//     }
//   }

//   deposit(amount) {
//     this.verifyAccount();
//     this.verifyDeposit(amount);
//     this._balance = this._balance + amount;
//   }

//   verifyDeposit(amount) {
//     if (amount < 0) {
//       throw new ValueError_();
//     }
//   }

//   withdraw(amount) {
//     this.verifyAccount();
//     this.verifyWithdraw(amount);
//     this._balance = this._balance - amount;
//   }

//   verifyWithdraw(amount) {
//     if (amount < 0 || amount > this._balance) {
//       throw new ValueError_();
//     }
//   }

//   get balance() {
//     this.verifyAccount();
//     return this._balance;
//   }

//   get isOpen() {
//     return this._open;
//   }
// }

// export class ValueError extends Error {}

class BankAccount {
  construct new() {
    _open = false
  }

  open() {
    if(_open) error_()

    _open = true
    _balance = 0
  }

  close() {
    if(!_open) error_()

    _open = false
    _balance = 0
  }

  deposit(amount) {
    if(!_open) error_()
    if (amount<0) error_()

    _balance = _balance + amount
  }

  withdraw(amount) {
    if (!_open) error_()
    if (amount<0) error_()
    if (amount>_balance) error_()

    _balance = _balance - amount
  }

  balance {
    if (!_open) error_()
    return _balance
  }
  error_() { Fiber.abort("Bank account error") }
}
