defmodule FooApi.Plugs.BasicAuth do
  import Plug.Conn
  import Ecto.Query

  alias FooApi.Repo
  alias FooApi.User

  def init(default), do: default

  def call(conn, params) do
    if (authenticated?(conn.assigns)) do
      conn
    else
      Blaguth.halt_with_login(conn, "admin")
    end
  end

  defp authenticated?(%{credentials: {username, password}}) do
    query = from users in User, where: users.username == ^username
    user = Repo.one query

    authenticate user, password
  end

  defp authenticate(nil), do: :false
  defp authenticate(%User{password: hash, salt: salt}, password) do
    computed = :crypto.hash :sha256, salt <> password

    computed == hash
  end
end
