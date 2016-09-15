require 'ffaker'
FactoryGirl.define do

  factory :user do

    email { "person_#{SecureRandom.hex}@example.com" }
    password { "please123" }
    # uncomment these lines to enable admin
    # admin false
    # trait :admin do
    #   admin true
    # end

  end


end
