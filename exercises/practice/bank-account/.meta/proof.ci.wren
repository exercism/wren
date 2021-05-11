class BankAccount {
  construct new() {
    _open = false
  }

  isOpen { _open }
  open() {
    if(isOpen) error_()

    _open = true
    _balance = 0
  }

  close() {
    if(!isOpen) error_()

    _open = false
    _balance = 0
  }

  deposit(amount) {
    if(!isOpen) error_()
    if (amount<0) error_()

    _balance = _balance + amount
  }

  withdraw(amount) {
    if (!isOpen) error_()
    if (amount<0) error_()
    if (amount>_balance) error_()

    _balance = _balance - amount
  }

  balance {
    if (!isOpen) error_()
    return _balance
  }
  error_() { Fiber.abort("Bank account error") }
}
