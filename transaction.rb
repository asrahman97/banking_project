 class Transactions < Accounts

  attr_accessor

  def initialize (checkings, savings)
  # super(customer_name, _first_name, last_name, SSN, address, account_type)
    super(checkings, savings)
  # @transaction_number = rand(999)
  # @transaction_type = trans_type
  # @amount = 0
  # @time_stamp = Time.now.utc
  # @account_from = account_from
  # @account_to = account_to
  end

  def withdrawal(account_from, account_to, amount)
    @accounts_from = account_from
    @accounts_to = account_to
    puts amount
    File.open(File.dirname(__FILE__) + "/account_data/withdrawals.txt", "a") do |record|
      record.puts "#{account_from}, #{account_to}, #{amount}"
    end
  end

  def deposit(account_from, account_to, amount)
    puts account_from
    puts account_to
    puts amount
    File.open(File.dirname(__FILE__) + "/account_data/deposits.txt", "a") do |record|
      record.puts "#{account_from}, #{account_to}, #{amount}"
    end
  end

end

test_transaction = Transactions.new(500, 2000)
puts test_transaction.account_info
# test_transaction.withdrawal("Checking", "Savings", 1000)
# test_transaction.deposit("Savings", "Checking", 1000)
