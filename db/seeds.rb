
  @user =  User.create!(
      name: "Doug",
      description: "Place for rent",
      email:"someone@example.com",
      password:"123456",
      )

5.times do
    Location.create!(
      name:Faker::Address.street_name,
      address:Faker::Address.street_address,
      price_per_day:rand(100..200),
      description:Faker::Company.catch_phrase,
      capacity:rand(5..20),
      user: @user
      )
end

puts "... created #{Location.count} ."

