require_relative ('./transaction')

aladdin = Transactions.new("Aladdin", "Omar", 12345, "123 Main", 3636, 69420)
ash = Transactions.new("Ash", "Money", 54213, "123 Main", 3636, 69420)
rico = Transactions.new("Rico", "Bra", 94836, "123 Main", 3636, 69420)

def menu(ash)
  puts "Welcome to Westpac\nWhat can we do for you today?\n1. Create Account\n2. Check Balance\n3. Deposit\n4. Withdrawal\n5. Transfer\n6. Exit\n"
  input = gets.strip.to_i
  puts input
  if input == 1
    puts "Please provide the following information:\nAccount name:"
    account_name = gets.strip.to_s
    puts "First name:"
    first_name = gets.strip.to_s
    puts "Last name:"
    last_name = gets.strip.to_s
    puts "SSN:"
    ssn = gets.strip.to_i
    puts "Address:"
    address = gets.strip.to_s
    account_name = Transactions.new(first_name, last_name, ssn, address, 0, 0)
    puts "Processing..."
    sleep 1.0
    puts "Welcome to Westpac Bank #{first_name} #{last_name}\nYour customer number is: #{@customer_number}"

  elsif input == 2
    puts "Please wait will we get your information"
    fin_data = ash.account_info
    sleep 1.0
    puts "Your total balance is: #{fin_data[0]}\nYou have #{fin_data[1]} USD in your checkings account\nYou have #{fin_data[2]} USD in your savings accounts"

  elsif input == 3
    puts "** Deposit menu **\n\nTo which account would you like to deposit?\n(S)avings\n(C)heckings\n\nTo return press R"
    account_type = gets.strip.to_s.downcase
    if account_type == 'r'
      menu(ash)
    end
    puts "How much would you like to deposit?"
    amount = gets.strip.to_i
    puts "Please wait while we process your request"
    if account_type == 's'
      ash.deposit_savings(amount)
    elsif account_type == 'c'
      ash.deposit_checkings(amount)
    else
      puts "Sorry, no valid entry received"
    end

  elsif input == 4
    puts "** Withdrawal menu **\n\nFrom which account would you like to withdraw?\n(S)avings\n(C)heckings\n\nTo return press R"
    account_type = gets.strip.to_s.downcase
    if account_type == 'r'
      menu(ash)
    end
    puts "How much would you like to withdraw?"
    amount = gets.strip.to_i
    puts "Please wait while we process your request"
    if account_type == 's'
      ash.withdraw_savings(amount)
    elsif account_type == 'c'
      ash.withdraw_checkings(amount)
    else
      puts "Sorry, no valid entry received"
    end

  elsif input == 5
    puts "** Transfer menu**\n\nFrom which account would you like to transfer?\n(S)avings\n(C)heckings\n\nTo return press R"
    from_account = gets.strip.to_s
    if from_account == "s"
      puts "To which account would you like to transfer?\n(C)heckings\n(O)ther Account\nTo return press R"
      to_account = gets.strip.to_s
      puts "How much would you like to transfer?"
      amount = gets.strip.to_i
      puts "Please wait while we process your request"
      if to_account == "c"
        ash.transfer_checking(amount)
      else
        puts "Sorry, this functionality is not available yet"
      end
    elsif from_account == "c"
      puts "To which account would you like to transfer?\n(S)avings\n(O)ther Account\nTo return press R"
      to_account = gets.strip.to_s
      puts "How much would you like to transfer?"
      amount = gets.strip.to_i
      puts "Please wait while we process your request"
      if to_account == "s"
        ash.transfer_checking(amount)
      else
        puts "Sorry, this functionality is not available yet"
      end
    end
  elsif input == 6
    puts "Right-o mate. See ya later. Ciao 4 now!"
    # break
  end

  sleep 2
  menu(ash)
end


menu(ash)