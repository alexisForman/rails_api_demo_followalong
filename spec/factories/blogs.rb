require 'faker'
FactoryBot.define do
    factory :blog do
        title   { Faker::Lorem.sentence }
        content { Faker::Lorem.paragraph }
        image_path  { "https://cdn.pixabey.com/photo/2015/04/23/22/00/tree-736885_480.jpeg" }
    end
end