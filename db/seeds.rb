puts "🌱 Seeding spices..."

# Seed your database here
10.times do 
    Student.create(
        first_name: Faker::Name.name,
        last_name: Faker::Name.unique.name,
        gender: Faker::Gender.binary_type,
        email: Faker::Internet.email,
        password: Faker::Alphanumeric.alphanumeric(number: 10))
    end 

    rand(1..10).times do
        student = Student.order('RANDOM()').first 

        
puts "✅ Done seeding!"
