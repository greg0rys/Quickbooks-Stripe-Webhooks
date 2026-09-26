FactoryBot.define do
  factory :reconciliation do
    stripe_payout_id { "MyString" }
    gross_cents { 1 }
    fee_cents { 1 }
    net_cents { 1 }
    currency { "MyString" }
    qbo_deposit_id { "MyString" }
    qbo_expense_id { "MyString" }
    status { 1 }
    payout_date { "2026-09-26 02:38:18" }
  end
end
