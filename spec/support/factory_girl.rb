require 'factory_girl'

FactoryGirl.define do
  factory :user do |f|
    f.sequence(:email) {|n| "dodo#{n}@gmail.com"}
    f.password "secret123"
    f.name "dodo"
  end
  factory :partner do |f|
    f.company "spectoos"
  end
end
