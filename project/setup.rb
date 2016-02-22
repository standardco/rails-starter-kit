require 'open-uri'

def config_project_settings
  puts " \ntype \"quit\" at any time to abort project setup \n\n"
  get_original_name
  set_new_name
  update_read_me
  update_app_layout_title
  update_db_name
  update_session_store
  update_application_config_module
end

def get_original_name
  response = get_response("Replace 'rails-starter-kit' and variations throughout project? (y/n)")
  if response == 'y'
    @original_name = 'rails-starter-kit'
  else 
    response = get_response("\nWhat is the project name to replace?")
    @original_name = response
  end
end

def set_new_name
  @new_name = get_response("\nWhat is the new project name?")
end

def update_read_me
  filepath =  "#{Rails.root}/README.md"
  if @new_name == 'rails-starter-kit'
    url = "https://raw.githubusercontent.com/codeisstandard/rails-starter-kit/master/README.md"
    update = open(url).read
  else
    update = "# #{@new_name.titleize}"
  end
  original_string = @original_name
  update_file(update, filepath, original_string)
end

def update_app_layout_title
  filepath =  "#{Rails.root}/app/views/layouts/application.html.erb"
  content = File.open(filepath, "r").read
  update = content.gsub @original_name.titleize, @new_name.titleize
  original_string = @original_name.titleize
  update_file(update, filepath, original_string)
end

def update_db_name
  filepath =  "#{Rails.root}/config/database.yml"
  content = File.open(filepath, "r").read
  update = content.gsub @original_name, @new_name
  update.gsub! @original_name.upcase, @new_name.upcase
  original_string = @original_name
  update_file(update, filepath, original_string)
end

def update_session_store
  filepath =  "#{Rails.root}/config/initializers/session_store.rb"
  content = File.open(filepath, "r").read
  update = content.gsub @original_name, @new_name
  original_string = @original_name
  update_file(update, filepath, original_string)
end

def update_application_config_module
  filepath =  "#{Rails.root}/config/application.rb"
  content = File.open(filepath, "r").read
  original_string = @original_name.titleize.remove(' ')
  update = content.gsub original_string, @new_name.titleize.remove(' ')
  update_file(update, filepath, original_string)
end

def update_file(update, filepath, original_string)
  content = File.open(filepath, "r").read
  if content.include?(original_string) || @new_name == 'rails-starter-kit' 
    File.open(filepath, "w+").write(update)
    puts "updated #{filepath}"
  else
    puts "no changes to #{filepath}"
  end
end

def user_input
  response = STDIN.gets.downcase.strip.gsub(' ', '_')
  puts response
  exit if response == "quit"
  return response
end

def get_response(prompt)
  puts prompt
  print ">> "
  options = prompt.split('(')[1]
  response = user_input
  if options.present?
    options = options.remove(')').split('/')
    until options.include? response || response == "quit"
      puts "\nResponse not valid. Try again or type \"quit\"."
      puts "\n#{prompt}"
      print ">> "
      response = user_input
    end
  end
  return response
end

config_project_settings
