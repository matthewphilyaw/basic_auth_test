defmodule FooApi.Repo.Migrations.CreateBar do
  use Ecto.Migration

  def change do
    create table(:bars) do
      add :barnism, :string

      timestamps
    end

  end
end
