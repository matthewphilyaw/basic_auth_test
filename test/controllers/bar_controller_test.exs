defmodule FooApi.BarControllerTest do
  use FooApi.ConnCase

  alias FooApi.Bar
  @valid_attrs %{barnism: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, bar_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    bar = Repo.insert! %Bar{}
    conn = get conn, bar_path(conn, :show, bar)
    assert json_response(conn, 200)["data"] == %{id: bar.id,
      barnism: bar.barnism}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, bar_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, bar_path(conn, :create), bar: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Bar, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, bar_path(conn, :create), bar: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    bar = Repo.insert! %Bar{}
    conn = put conn, bar_path(conn, :update, bar), bar: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Bar, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    bar = Repo.insert! %Bar{}
    conn = put conn, bar_path(conn, :update, bar), bar: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    bar = Repo.insert! %Bar{}
    conn = delete conn, bar_path(conn, :delete, bar)
    assert response(conn, 204)
    refute Repo.get(Bar, bar.id)
  end
end
