namespace :project do

  desc "Configure project settings"
  task :setup => :environment do
    load File.join(Rails.root, "project", "setup.rb")
  end

end