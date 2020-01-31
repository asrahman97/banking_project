class Customer

    attr_accessor :first_name, :last_name, :ssn, :address, :account_number, :customer_number

    def initialize(first_name, last_name, ssn, address, account_number, customer_number)
      @first_name = first_name
      @last_name = last_name
      @ssn = ssn
      @address = address
      @account_number = account_number
      @customer_number = customer_number_generator
      save_record
    end

    def save_record
      File.open(File.dirname(__FILE__ ) + "/account_data/customer.txt", "a") do |line|
          line.puts "#{@first_name}, #{@last_name}, #{@ssn}, #{@address}, #{@account_number}, #{@customer_number}"
      end
    end

    def customer_number_generator
      baseline_customer_number = 1000
      next_index = 0

      File.open(File.dirname(__FILE__ ) + '/account_data/customer.txt', 'r') do |line|
        next_index = line.readlines.length.to + 1
      end
      baseline_customer_number += next_index
    end

    def print_info
      puts @first_name
      puts @last_name
      puts @ssn
      puts @address
      puts @account_number
      puts @customer_number
    end

end

rico = Customer.new("Rico", "Braamburg", 12345678, "Long Island City", 1, 1)
rico.print_info
