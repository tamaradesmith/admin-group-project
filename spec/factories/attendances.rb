FactoryBot.define do
  factory :attendance do
    am{"present"}
    pm{ "present"}
    # even{"present"}
    date{"nov 4, 2019"}
    association(:user, factory: :user)
    

  end
end
