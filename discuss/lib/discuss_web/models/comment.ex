defmodule DiscussWeb.Models.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:content, :user]}

  schema "topics" do
    field :content, :string
    belongs_to :user, DiscussWeb.Models.User
    belongs_to :topic, DiscussWeb.Models.Topic
    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:content])
    |> validate_required([:content])
  end

end
