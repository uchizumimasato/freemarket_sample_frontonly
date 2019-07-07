FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    name                  {"かな"}
    name_kana             {"カナ"}
    email                 {"a@a"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    postal_code           {"1234567"}
    prefecture            {1}
    city                  {"札幌市"}
    address               {"1-1"}
  end

end
