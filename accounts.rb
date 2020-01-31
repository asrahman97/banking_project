class Accounts
  def initialize(account_number, account_type, balance, overdrafts, last_accessed, customer_number, checkings, savings)
    #super
    @account_number = account_number
    @account_type = account_type
    @balance = balance
    @overdrafts = overdrafts
    @last_accessed = last_accessed
    @customer_number = customer_number
    @checkings = checkings
    @savings = savings
    file_open
  end
  def account_info
    puts @account_number
    puts @account_type
    puts @balance
    puts @overdrafts
    puts @last_accessed
    puts @customer_number
    puts @checkings
    puts @savings
  end
end

def file_open
File.open(File.dirname(__FILE__) + '/account_data/account_info.txt', 'a') do |line|
  line.puts "#{@account_number}, #{@account_type}, #{@balance}, #{@overdrafts}, #{@last_accessed}, #{@customer_number}
  #{@checkings}, #{@savings}"
  end
end

aladdin = Accounts.new("10004", "checking", "$1000", "none",
                       "12 mins ago", "12", "$1000", "$0")
puts aladdin.account_info