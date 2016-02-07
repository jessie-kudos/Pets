FactoryGirl.define do
  factory :pet do
    species { %w(dog cat other).sample }
    name { Faker::Name.name }
    sex { %w(male female unknown).sample }
    colour { Faker::Lorem.word }
    identification { Faker::Lorem.word }
    location { %w(NE NW SE SW Central).sample }
    # photo_file_name { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    status { Faker::Lorem.word }
    user
  end
end
