# Inheritance
FactoryGirl.define do
  factory :zombie do
    name 'Ash'
    graveyard 'Oak Park'

    factory :zombie_bill do
      name 'Bill'
    end

    factory :zombie_mike do
      name 'Mike'
      graveyard 'Sunnyvale'
    end
  end
end

# Sequences
FactoryGirl.define do
  factory :zombie do
    sequence(:name) { |i| "Ash#{i}" }
    graveyard 'Oak Park'
  end
end

# Associations
FactoryGirl.define do
  factory :armed_zombie, class: Zombie do
    sequence(:name) { |i| "ArmedAsh#{i}" }
    association :weapon
    graveyard 'Oak Park'
  end
end
