# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[
  { name: 'John Doe', email: 'john.doe@example.com' },
  { name: 'Mary Poppins', email: 'mary.poppins@example.com' },
].each do |user_info|
  User.find_or_create_by!(
    name: user_info[:name],
    email: user_info[:email],
  )
end
