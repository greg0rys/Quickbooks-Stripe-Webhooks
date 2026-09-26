class Avo::Resources::SyncLog < Avo::BaseResource
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
    field :stripe_event_id, as: :text
    field :event_type, as: :text
    field :status, as: :number
    field :qbo_entity_type, as: :text
    field :qbo_entity_id, as: :text
    field :payload, as: :code
    field :error_message, as: :textarea
    field :attempts, as: :number
    field :duration_ms, as: :number
  end
end
