require_relative ('./customer')

class Accounts < Customer
  def initialize(first_name, last_name, ssn, address, checkings, savings)
    @account_number = account_number_generator
    @account_type = "checking"
    @overdrafts = false
    @last_accessed = Time.now.utc
    @customer_number = customer_number_generator
    @checkings = checkings
    @savings = savings
    @balance = checkings + savings
    file_open
    super(first_name, last_name, ssn, address, @customer_number)
  end

  def account_number_generator
    baseline_account_number = 100000
    next_index = 0
    File.open(File.dirname(__FILE__ ) + '/account_data/account_info.txt', 'r') do |line|
      next_index = line.readlines.length.to_i + 1
    end
    baseline_account_number += next_index
  end

  def account_checking(new_balance, old_balance)
    database = []
    index = nil
    File.open(File.dirname(__FILE__ ) + '/account_data/account_info.txt', 'r' ) do |line1|
      line1.readlines.each_with_index do |record, index1|
        database << record
        temp = record.split(", ")
        if temp[-3].to_i == @customer_number.to_i
          index = index1
        end
      end
    end
    change = database[index].gsub(old_balance.to_s, new_balance.to_s)
    database[index] = change
    mutate_record(database)
  end

  def mutate_record(database)
    file = File.open(File.dirname(__FILE__) + '/account_data/account_info.txt', 'w')
    database.each do |entry|
      file.write(entry)
    end
  end

  def transfer_money(old_checking, old_savings, checking, saving)
    database = []
    index = nil
    File.open(File.dirname(__FILE__ ) + '/account_data/account_info.txt', 'r' ) do |line1|
      line1.readlines.each_with_index do |record, index1|
        database << record
        temp = record.split(", ")
        if temp[-3].to_i == @customer_number.to_i
          index = index1
        end
      end
    end
    change = database[index].gsub(old_checking.to_s, checking.to_s)
    database[index] = change
    change = database[index].gsub(old_savings.to_s, saving.to_s)
    database[index] = change
    mutate_record(database)
  end

  def account_info
    puts @customer_number
    puts @checkings
    puts @savings
  end
end

def file_open
File.open(File.dirname(__FILE__) + '/account_data/account_info.txt', 'a') do |line|
  line.puts "#{@account_number}, #{@account_type}, #{@balance}, #{@last_accessed}, #{@customer_number}, #{@checkings}, #{@savings}"
  end
end
