# Made by Zak Freeman

# converts input to true/false
class String
  def to_b
    ["y", "yes", "Y", "YES"].include?(self.chomp.downcase)
  end
end

# all possible characters in password removed certain symbols so that the passwords are easier to type/remember
character_list = {
    lowercase_letters: ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"],
    uppercase_letters: ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"],
    numbers: ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"],
    symbols: ["!", "#", "$", "%", "&", "(", ")", "*", "+", "-", "<", "=", ">", "@", "{", "}", "^"],

}

# possible character types in password
password_combinations = [:lowercase_letters, :uppercase_letters, :numbers, :symbols]

# creates rules for the password

def character_selection(password_combinations)
  questions = ["do you want lowercase letters in your password? ", "do you want uppercase letters in your password? ", "do you want numbers in your password? ", "do you want symbols in your password? (e.g [, <, {, &) "]
  array_pos = 0
  4.times do |x|
    # asks user what type of characters they want in their password
    print questions[x]
    answer = gets.chomp.to_b

    if answer != true
      password_combinations.delete(password_combinations[x - array_pos])
      array_pos +=1
    end

  end
end

def password_generator(character_list,password_combinations)
  password = ''

  # prompts user input
  print 'What length do you want your password to be? '
  pass_length = gets.to_i

  pass_length.times do
    # adds a random character from the users selection of character types user specified number of times
    password.concat(character_list[password_combinations.sample].sample)
  end
  
  print password
end

character_selection(password_combinations)
password_generator(character_list,password_combinations)
