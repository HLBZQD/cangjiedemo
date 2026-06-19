package cangjiedemo

import std.unittest.*
import std.unittest.testmacro.*

@Test
public class BankAccountTest {
    @TestCase
    public func testInitailBalance() : Unit {
        var account = BankAccount()
        @Assert(0, account.getBalance())
    }

    @TestCase
    public func testDeposit() : Unit {
        var account = BankAccount()
        account.deposit(10)
        @Assert(10, account.getBalance())
    }

    @TestCase
    public func testWithdraw() : Unit {
        var account = BankAccount()
        account.deposit(100)
        account.withdraw(50)
        @Assert(50, account.getBalance())
    }

    @TestCase
    public func testWithdrawMoreThanBalance() : Unit {
        var account = BankAccount()
        account.deposit(10)
        @ExpectThrows[IllegalArgumentException](account.withdraw(150))
    }
}

public class BankAccount {
    private var balance: Int = 0

    public init() {
        balance = 0
    }

    public func getBalance() : Int {
        return balance
    }

    public func deposit(amount: Int) : Unit {
        balance += amount
    }

    public func withdraw(amount: Int) : Unit {
        if (amount > balance) {
            throw IllegalArgumentException("Withdrawal amount exceeds balance")
        }
        balance -= amount
    }
}