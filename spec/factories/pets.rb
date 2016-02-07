FactoryGirl.define do
  factory :pet do
    species { ['dog', 'cat', 'other'].sample }
    name { Faker::Name.name }
    sex { ['male', 'female', 'unknown'].sample }
    colour { Faker::Lorem.word }
    identification { Faker::Lorem.word }
    location { ['NE', 'NW', 'SE', 'SW', 'Central' ].sample }
    # photo_file_name { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    status { Faker::Lorem.word }
    user
  end
end
