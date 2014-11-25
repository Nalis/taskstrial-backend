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

  factory :task do |f|
    f.title 'Title 1'
    f.description 'Lorem ipsum 1'
    f.owner { FactoryGirl.build(:user) }
  end
end
