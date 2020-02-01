require_relative './accounts'

class Transactions < Accounts
  def initialize (first_name, last_name, ssn, address, checkings, savings)
    super(first_name, last_name, ssn, address, checkings, savings)
    @checkings = checkings
  end

  def transaction_history(account_type, old_balance, new_balance)
    File.open(File.dirname(__FILE__) + "/account_data/transaction_history.txt", "a") do |record|
      record.puts "#{@customer_number}, #{account_type} #{old_balance}, #{new_balance}, #{Time.now.utc}"
    end
  end

  def deposit_checkings(amount_deposited)
    old_balance = @checkings
    @checkings += amount_deposited
    transaction_history("checking", old_balance, @checkings)
    account_checking(@checkings, old_balance)
  end

  def withdraw_checkings(amount_withdrawn)
    old_balance = @checkings
    @checkings > 100 ?
        (@checkings -= amount_withdrawn
    transaction_history("checking", old_balance, @checkings)
    account_checking(@checkings, old_balance)) :
        (puts "Hey man, consider saving")
  end

  def deposit_savings(amount_deposited)
    old_savings = @savings
    @savings += amount_deposited
    transaction_history("savings", old_savings, @savings)
    account_checking(@savings, old_savings)
  end

  def withdraw_savings(amount_deposited)
    old_savings = @savings
    @savings > 100 ?
        (@savings -= amount_deposited
    transaction_history("savings", old_savings, @savings)
    account_checking(@savings, old_savings)) :
        (puts "Hey dude, consider saving")
  end

  def transfer_checking(amount)
    @checkings > amount ? (
    old_checking = @checkings
    old_savings = @savings
    @checkings -= amount
    @savings += amount
    transfer_money(old_checking, old_savings, @checkings, @savings)
    transaction_history("transfer", @checkings, @savings)
    ) : (puts "Hey bro, enter a smaller amount to transfer")
  end

  def transfer_savings(amount)
    @savings > amount ? (
    old_checking = @checkings
    old_savings = @savings
    @checkings += amount
    @savings -= amount
    transfer_money(old_checking, old_savings, @checkings, @savings)
    transaction_history("transfer", @checkings, @savings)
    ) : (puts "Hey bro, enter a smaller amount to transfer")
  end

  def puts_hello
    puts "Hello"
  end
end

aladdin = Transactions.new("Aladdin", "Omar", 12345, "123 Main", 3636, 69420)
ash = Transactions.new("Ash", "Money", 54213, "123 Main", 3636, 69420)
rico = Transactions.new("Rico", "Bra", 94836, "123 Main", 3636, 69420)
# test_transaction = Transactions.new("Aladdin", "Omar", 12345, "123 Main", 3636, 69420)

# ash.deposit_checkings(12345678)
# aladdin.withdraw_checkings(345678)
# rico.deposit_savings(23523534643)
# ash.withdraw_savings(9876543)

# ash.transfer_checking(333)
# ash.transfer_savings(345)