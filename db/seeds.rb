puts "🌱 Seeding spices..."

# Seed your database here
10.times do 
    Student.create(
        student_image:Faker::LoremFlickr.image, 
        first_name: Faker::Name.name,
        last_name: Faker::Name.unique.name,
        gender: Faker::Gender.binary_type,
        email: Faker::Internet.email,
        password: Faker::Alphanumeric.alphanumeric(number: 10))
    end 

    rand(1..10).times do
        student = Student.order('RANDOM()').first 

        Teacher.create( 
            teacher_image:Faker::LoremFlickr.image,
            teacher_name: Faker::Name.name,
            teacher_email:Faker::Internet.email,
            lesson_id: rand(1..10))
          end

        rand(1..12).times do
            lesson = Lesson.order('RANDOM()').first

           
            Lesson.create( 
                lesson_name: Faker::Name.name,
                lesson_teacher: Faker::Name.unique.name,
                progress: Faker::Boolean.boolean,
                teacher_id: rand(1..10))
            end
puts "✅ Done seeding!"
