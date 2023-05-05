FactoryBot.define do
  factory :user do
    name                  {'test'}
    email                 {'test@example'}
    password              {'000000'}
<<<<<<< Updated upstream
    password_confirmation {password}
    profire               {xxxxxxxx}
=======
    password_confirmation {'password'}
    profire               {'abc'}
>>>>>>> Stashed changes
  end
end