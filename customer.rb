class Customer
    attr_accessor :first_name, :last_name, :ssn, :address, :account_number, :customer_number
    def initialize(first_name, last_name, ssn, address, customer_number)
      @first_name = first_name
      @last_name = last_name
      @ssn = ssn
      @address = address
      @customer_number = customer_number
      save_record
    end

    def save_record
      File.open(File.dirname(__FILE__ ) + "/account_data/customer.txt", "a") do |line|
          line.puts "#{@first_name}, #{@last_name}, #{@ssn}, #{@address}, #{@customer_number}"
      end
    end

    def customer_number_generator
      baseline_customer_number = 800
      next_index = 0
      File.open(File.dirname(__FILE__ ) + '/account_data/customer.txt', 'r') do |line|
        next_index = line.readlines.length.to_i + 1
      end
      baseline_customer_number += next_index
    end

    def get_customer_id(name)
      File.open(File.dirname(__FILE__) + '/account_data/customer/txt', 'r') do |line|
        p line.readlines
      end
    end

    def print_info
      puts @first_name
      puts @last_name
      puts @ssn
      puts @address
      puts @customer_number
    end
end

