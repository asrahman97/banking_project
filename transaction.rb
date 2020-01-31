class Transactions

  attr_accessor

  # def initialize (trans_type, amount)
    # super(customer_name, _first_name, last_name, SSN, address, account_type)
    # @transaction_number = rand(999)
    # @transaction_type = trans_type
    # @amount = 0
    # @time_stamp = Time.now.utc
    # @account_from = account_from
    # @account_to = account_to
  # end

  def withdrawal(account_from, account_to, amount)
    puts account_from
    puts account_to
    puts amount
  end

  def deposit(account_from, account_to, amount)
    puts account_from
    puts account_to
    puts amount
  end

end

test_transaction = Transactions.new
test_transaction.withdrawal("Checking", "Savings", 1000)
test_transaction.deposit("Savings", "Checking", 1000)
