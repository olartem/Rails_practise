FactoryBot.define do
    factory :user do
        id {1}
        email {"test@user.com"}
        password {"qwerty"}
        name {"test-name"}
    end
    factory :admin do
        id {1}
        email {"test@admin.com"}
        password {"qwerty"}
        name{"admin-name"}
    end
end