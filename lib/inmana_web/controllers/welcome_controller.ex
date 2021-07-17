defmodule InmanaWeb.WelcomeController do
  use InmanaWeb, :controller

  alias Inmana.Welcomer

  def index(conn, params) do
    params
    |> Welcomer.welcome()
    |> handle_response(conn)
  end

  defp handle_response({:ok, message}, conn) do
    render_response(conn, :ok, message)
  end

  defp handle_response({:error, message}, conn) do
    render_response(conn, :bad_request, message)
  end

  defp render_response(conn, status, message) do
    conn
    |> put_status(status)
    |> json(%{message: message})
  end
end
