defmodule Canary.ErrorHandler do
  @moduledoc """
  Specifies the behavior for handling errors in Canary.


  """
  @moduledoc since: "2.0.0"

  @doc """
  Handles the case where a resource is not found.
  """
  @callback not_found_handler(Plug.Conn.t()) :: Plug.Conn.t()

  @doc """
  Handles the case where a resource is not authorized.
  """
  @callback unauthorized_handler(Plug.Conn.t()) :: Plug.Conn.t()

  if Code.ensure_loaded?(Phoenix.LiveView) do
    @callback not_found_handler(Phoenix.LiveView.Socket.t()) ::
                {:halt, Phoenix.LiveView.Socket.t()}
    @callback unauthorized_handler(Phoenix.LiveView.Socket.t()) ::
                {:halt, Phoenix.LiveView.Socket.t()}
  end
end
