defmodule FooApi.Repo.Migrations.CreateUser do
  use Ecto.Migration

  @admin_password

  def change do
    create table(:users) do
      add :username, :string
      add :password, :binary
      add :salt, :binary

      timestamps
    end
  end
end
