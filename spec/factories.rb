FactoryBot.define do
  factory :user do
    email { "johndoe@example.com" }
    password { "password" }
    full_name { "John Doe" }
    slug { "john-d" }
    bio { "Web developer" }
    admin { false }
    last_sign_in_at { DateTime.now }
  end

  factory :story do
    title { "My first blog post" }
    content { "Hello, World!" }
    association :owner, factory: :user
  end

  factory :tag do
    name { "jquery" }
  end
end
