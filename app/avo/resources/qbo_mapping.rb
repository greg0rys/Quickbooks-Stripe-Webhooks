class Avo::Resources::QboMapping < Avo::BaseResource
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
    field :qbo_credential, as: :belongs_to
    field :clearing_account_id, as: :text
    field :checking_account_id, as: :text
    field :fee_account_id, as: :text
    field :sales_account_id, as: :text
  end
end
