class Avo::Resources::QboCredential < Avo::BaseResource
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
    field :realm_id, as: :text
    field :access_token, as: :textarea
    field :refresh_token, as: :textarea
    field :access_token_expires_at, as: :date_time
    field :refresh_token_expires_at, as: :date_time
    field :status, as: :number
  end
end
