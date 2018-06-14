require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/student.rb')
also_reload('./models/*')

#index
get '/students' do
  @students = Student.find_all()
  erb(:index)
end

#new
get '/students/new' do
  erb(:new)
end

#CREATE
post '/students' do
  @student = Student.new(params)
  @student.save
  # erb(:create)
  redirect to '/students'
end
