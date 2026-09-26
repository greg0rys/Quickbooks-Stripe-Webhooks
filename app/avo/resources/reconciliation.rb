class Avo::Resources::Reconciliation < Avo::BaseResource
  # self.icon = "tabler/outline/users"
  # self.avatar = {
  #   source: :avatar
  # }
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: q, m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    # field :avatar, as: :avatar
    field :stripe_payout_id, as: :text
    field :gross_cents, as: :number
    field :fee_cents, as: :number
    field :net_cents, as: :number
    field :currency, as: :text
    field :qbo_deposit_id, as: :text
    field :qbo_expense_id, as: :text
    field :status, as: :number
    field :payout_date, as: :date_time
  end
end
