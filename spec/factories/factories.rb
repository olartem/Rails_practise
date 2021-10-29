FactoryBot.define do
    sequence(:email){|n| "test-#{n.to_s.rjust(3,'0')}@mail.com"}
    factory :user do
        email {FactoryBot.generate :email}
        password {"123456"}
        name {"test"}
    end
end