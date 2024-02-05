# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
cats = [
  {
    name: 'Felix',
    age: 2,
    enjoys: 'Long naps on the couch, and a warm fire.',
    image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
  },
  {
    name: 'Homer',
    age: 12,
    enjoys: 'Food mostly, really just food.',
    image: 'https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1015&q=80'
  },
  {
    name: 'Jack',
    age: 5,
    enjoys: 'Furrrrociously hunting bugs.',
    image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80'
  },
  {
    name: 'Tigger',
    age: 3,
    enjoys: 'Stopped jumping and started taxing honey. Bish betta have my honey.',
    image:  'https://www.google.com/imgres?imgurl=https%3A%2F%2Fi.etsystatic.com%2F40383551%2Fr%2Fil%2F9fbfa0%2F4569698620%2Fil_fullxfull.4569698620_tcpx.jpg&tbnid=Ttt0vYRORAv7IM&vet=12ahUKEwjqiqf26JSEAxVPPUQIHZwzB98QMygQegUIARCOAQ..i&imgrefurl=https%3A%2F%2Fwww.etsy.com%2Flisting%2F1404266777%2Faffiche-dun-tigre-en-costume&docid=M_8B7C6_fV1g8M&w=3000&h=3000&q=tigger%20in%20a%20suit&ved=2ahUKEwjqiqf26JSEAxVPPUQIHZwzB98QMygQegUIARCOAQ'
}
]

cats.each do |each_cat|
  Cat.create each_cat
  puts "creating cat #{each_cat}"
end