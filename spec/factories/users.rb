FactoryBot.define do
  factory :user do
    email                  {"test@example"}
    password               {"abc12345"}
    password_confirmation  {password}
  end
end
