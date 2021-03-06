FactoryBot.define do 
    sequence(:email) { |n| "person#{n}@example.com"}

    factory :user do
        email  
        name { FFaker::Name.name}
        password {'password'}
        password_confirmation{'password'}
        created_at {Date.today}
    end

    factory :post do
        title {FFaker::Movie.title}
        body {FFaker::Lorem.paragraph}
    end
end