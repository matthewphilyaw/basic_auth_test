defmodule FooApi.User do
  use FooApi.Web, :model

  schema "users" do
    field :username, :string
    field :password, :binary
    field :salt, :binary

    timestamps
  end

  @required_fields ~w(username password salt)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
