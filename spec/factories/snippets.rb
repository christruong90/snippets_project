FactoryGirl.define do
  factory :snippet do
    # we use sequence when we want to have one of our records to be unique so we
    # have an access to a counter variable `n` which we can use to generate
    # the unique field.

      title  { Faker::Name.title }
      work   { Faker::Name.title }

    end
end
