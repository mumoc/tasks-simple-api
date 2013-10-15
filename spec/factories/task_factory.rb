FactoryGirl.define do
  factory :task do
    sequence(:title) {|n| "Title #{n}" }
    content 'Lorem Ipsum'
  end
end
