defmodule FooApi.Bar do
  use FooApi.Web, :model

  schema "bars" do
    field :barnism, :string

    timestamps
  end

  @required_fields ~w(barnism)
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
