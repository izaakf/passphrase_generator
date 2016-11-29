# Made by Zak Freeman

# converts user input to boolean
class String
  def to_b
    ["y", "yes", "Y", "YES"].include?(self.chomp.downcase)
  end
end

# all possible characters in password. removed certain symbols so that the generated passwords are easier to type/remember
character_list = {
    lowercase_letters: [*?a..?z],
    uppercase_letters: [*?A..?Z],
    numbers: [*?0..?9],
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

    # if the user does not want a type of character it is removed from the possible character list
    if answer != true
      password_combinations.delete(password_combinations[x - array_pos])
      array_pos +=1
    end
  end
end

def password_generator(character_list,password_combinations)
  password = ''

  # prompts user input
  print "What length do you want your password to be? "
  pass_length = gets.to_i

  pass_length.times do
    # adds a random character from the users selection of character types user specified number of times
    password.concat(character_list[password_combinations.sample].sample)
  end

  print password
end

character_selection(password_combinations)
password_generator(character_list,password_combinations)
