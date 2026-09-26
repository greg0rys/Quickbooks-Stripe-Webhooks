FactoryBot.define do
  factory :sync_log do
    stripe_event_id { "MyString" }
    event_type { "MyString" }
    status { 1 }
    qbo_entity_type { "MyString" }
    qbo_entity_id { "MyString" }
    duration_ms { 1 }
  end
end
