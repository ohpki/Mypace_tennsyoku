FactoryBot.define do
  factory :job_informations do
    title { Faker::Lorem.characters(number:10) }
    work_style { Faker::Lorem.characters(number:30) }
    alarys { Faker::Lorem.characters(number:30) }
  end
end