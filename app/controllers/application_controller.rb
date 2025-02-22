class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get "/students" do 
    student = Student.all.order(:created_at)
    student.to_json
  end

  get "/teachers" do 
    teacher = Teacher.all.order(:created_at)
    teacher.to_json
  end

  get "/students/:id" do 
    lesson = Student.find(params[:id])
    lesson.to_json(include: lessons)
  end

  get "/lessons/:id" do 
    teacher = Lesson.find(params[:id])
    teacher.to_json(include: :teachers)
  end

  post "/signup" do

    if params[:first_name].empty? || params[:last_name].empty? || params[:email].empty? || params[:password].empty?
      return {statusCode: 400, message: "Fill in all the fields"}.to_json
    elsif Student.find_by(email: params[:email])
      return {statusCode: 409, message: "Student #{params[:email]} already exists"}.to_json
    elsif params[:password].length < 6
      return {statusCode: 409, message: "Password must be atleast 6 characters or more."}.to_json
    end
    student = Student.create(
      student_image: params[:student_image],
      first_name: params[:first_name],
      last_name: params[:last_name],
      gender: params[:gender],
      email: params[:email],
      password: params[:password]
    )
    payload = {
      studentId: student[:id],
      student_image:student[:student_image],
      first_name: student[:first_name],
      last_name: student[:last_name],
      gender: student[:gender],
      email: student[:email],
      password: student[:password]
    }
    token = JWT.encode payload, nil, 'HS256'

    {token: token}.to_json
  end
  
  post "/lessons" do 
    new_lesson = Lesson.create( 
      lesson_name: params[:lesson_name],
      lesson_teacher: params[:lesson_teacher],
      progress: params[:progress],
      teacher_id: params[:teacher_id]
    )
    new_lesson.to_json 
  end

  post "/teachers" do 
    new_teacher = Teacher.create( 
      teacher_name: params[:teacher_name],
      teacher_email: params[:teacher_email],
      lesson_id: params[:lesson_id]
    )
    new_teacher.to_json
  end

  patch "/students/:id" do 
    update_student = Student.find(params[:id])
    update_student.update( 
      password: params[:password]
    )
    update_student.to_json
  end
 
  patch "/lessons/:id" do 
    update_lesson = Lesson.find(params[:id])
    update_lesson.update( 
      progress: params[:progress]
    )
    update_lesson.to_json 
  end

  patch "/teachers/:id" do
    updtate_teacher = Teacher.find(params[:id])
    updtate_teacher.update( 
      teacher_email: params[:teacher_email]
    )
    update_teacher.to_json
  end

  delete "/lessons/:id" do
    lesson = Lesson.find(params[:id])
     lesson.destroy 
     lesson.to_json
  end

  delete "/teachers/:id" do 
    teacher = Teacher.find(params[:id])
    teacher.destroy 
    teacher.to_json
  end

  delete "/students/:id" do 
    student = Student.find(params[:id])
    student.destroy 
    student.to_json
  end
  
end
