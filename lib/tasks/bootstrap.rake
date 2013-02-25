def ask(question)
  print question + " "
  answer = STDIN.gets.chomp
  if answer == "" or answer.nil?
    return nil
  else
    return answer
  end
end
namespace :db do 
	desc "create default admin user" 
	task :create_admin => :environment do 
		
		admin = User.create( 
		:first_name => "Rodman", 
		:last_name => "Henley",
		:admin => true,
		:password => "admin", 
		:password_confirmation => "admin",
		:email => "rodman@gmail.com",
		:company => "Widget inc",
		:biz_type_id=>"1"
		) 
		admin.save!
	end 

	desc "Create user accounts with rake, prompting for user name and password."
    task :create_user => :environment do
     
      first_name    = ask("First Name: ")
      last_name     = ask("Last Name: ")
      email    = ask("Email: ")
      password = ask("Enter password: ") { |q| q.echo = false }
      confirm  = ask("Confirm password: ") { |q| q.echo = false }
      company    = ask("Company: ")
      biz_type    = ask("Business Category: ")
      
      user = User.new(:first_name => first_name, :last_name => last_name, :email => email, :password => password, :password_confirmation => confirm, :company => company, :biz_type_id => biz_type)

      if user.save
        puts "User account '#{email}' created."
      else
        puts
        puts "Problem creating user account:"
        puts user.errors.full_messages
      end
    end 
end 