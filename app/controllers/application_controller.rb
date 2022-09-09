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

  
end
