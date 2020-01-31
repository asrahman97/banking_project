require_relative ('./customer')

class Accounts < Customer
  def initialize(checkings, savings)
    super(first_name, last_name, ssn, address, account_number, customer_number)
    @account_number = account_number_generator
    @account_type = "checking"
    @overdrafts = false
    @last_accessed = Time.now.utc
    # @customer_number = customer_number
    @checkings = checkings
    @savings = savings
    @balance = checkings + savings
    file_open
  end

  def account_number_generator

    baseline_account_number = 100000
    next_index = 0

    File.open(File.dirname(__FILE__ ) + '/account_data/account_info.txt', 'r') do |line|
      # puts line.readlines[-1]
      # puts line.readlines.length
      next_index = line.readlines.length.to_i + 1
    end
    baseline_account_number += next_index
  end

  def account_info
    # puts @account_number
    # puts @account_type
    # puts @balance
    # puts @overdrafts
    # puts @last_accessed
    # puts @customer_number
    puts @checkings
    puts @savings
  end
end

def file_open
File.open(File.dirname(__FILE__) + '/account_data/account_info.txt', 'a') do |line|
  line.puts "#{@account_number}, #{@account_type}, #{@balance}, #{@last_accessed}, #{@customer_number}, #{@checkings}, #{@savings}"
  end
end

# aladdin = Accounts.new( "checking", "$1000", "none",
#                        "12 mins ago", "12", "$1000", "$0")
# puts aladdin.account_info