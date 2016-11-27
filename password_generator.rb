# Made by Zak Freeman
character_list = [*?0..?z]
def random_password_generator(character_list)

  password = character_list[rand(75)]
  puts password
end

random_password_generator(character_list)
