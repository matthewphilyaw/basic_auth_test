defmodule FooApi.BarController do
  use FooApi.Web, :controller

  alias FooApi.Bar

  plug :scrub_params, "bar" when action in [:create, :update]

  def index(conn, _params) do
    bars = Repo.all(Bar)
    render(conn, "index.json", bars: bars)
  end

  def create(conn, %{"bar" => bar_params}) do
    changeset = Bar.changeset(%Bar{}, bar_params)

    case Repo.insert(changeset) do
      {:ok, bar} ->
        conn
        |> put_status(:created)
        |> render("show.json", bar: bar)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(FooApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    bar = Repo.get!(Bar, id)
    render conn, "show.json", bar: bar
  end

  def update(conn, %{"id" => id, "bar" => bar_params}) do
    bar = Repo.get!(Bar, id)
    changeset = Bar.changeset(bar, bar_params)

    case Repo.update(changeset) do
      {:ok, bar} ->
        render(conn, "show.json", bar: bar)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(FooApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    bar = Repo.get!(Bar, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    bar = Repo.delete!(bar)

    send_resp(conn, :no_content, "")
  end
end
