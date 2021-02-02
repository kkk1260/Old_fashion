FactoryBot.define do
  factory :profile do
    user { nil }
    name { "MyString" }
    self_introduction { "MyText" }
  end
end
