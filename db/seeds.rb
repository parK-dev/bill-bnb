
  User.destroy_all
  Location.destroy_all
  Booking.destroy_all





  @user =  User.create!(
      name: "Doug",
      description: "Place for rent",
      email:"someone@example.com",
      password:"123456",
      )

5.times do
  file = URI.open('https://loremflickr.com/320/240/kitchen,chef')
   location = Location.new(
      name:Faker::Address.street_name,
      address:Faker::Address.street_address,
      price_per_day:rand(100..200),
      description:Faker::Company.catch_phrase,
      capacity:rand(5..20),
      user: @user
      )
   location.photo.attach(io: file, filename: "photo.jpg", content_type: "image/jpg")
   location.save!
end


puts "... created #{Location.count} ."

