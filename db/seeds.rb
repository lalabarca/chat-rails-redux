# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroying messages, users and channels..."
Message.destroy_all
User.destroy_all
Channel.destroy_all

puts "Creating channels"
channels = Channel.create([{name: 'general'}, {name: 'paris'}, {name: 'javascript'}])

puts "Creating users"
user1 = User.create({email: 'lala@gmail.com', password: 'password'})
user2 = User.create({email: 'david@gmail.com', password: 'password'})

puts "Creating messages"
Message.create(content: 'Hey salut', channel: channels.first, user: user1)
Message.create(content: 'Salut, ça va ?', channel: channels.first, user: user2)
Message.create(content: 'Ça va bien et toi ?', channel: channels.first, user: user1)
Message.create(content: "Je galère pas mal en js. Quelqu'un aurait des conseils ?", channel: channels[2], user: user1)

puts "Done!"
