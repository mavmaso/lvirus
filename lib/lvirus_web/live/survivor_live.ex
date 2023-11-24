defmodule LvirusWeb.SurvivorLive do
  use LvirusWeb, :live_view

  def render(assigns) do
    ~H"""
    <p>New Survivor</p>

    <.simple_form for={@form} id="survivor-form" phx-submit="save">
      <.input field={@form[:name]} type="text" label="Name" />
      <.input field={@form[:age]} type="number" label="Age" />
      <.input field={@form[:gender]} type="text" label="Gender" />
      <.button>SEND</.button>
    </.simple_form>

    <.table id="survivors" rows={@streams.survivors}>
      <:col :let={{_id, survivor}} label="Name"><%= survivor.name %></:col>
      <:col :let={{_id, survivor}} label="Age"><%= survivor.age %></:col>
      <:col :let={{_id, survivor}} label="Gender"><%= survivor.gender %></:col>
    </.table>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, stream(socket, :survivors, [])}
  end

  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action || :new, params)}
  end

  def handle_event("save", params, socket) do
    survivor = %{name: params["name"], age: params["age"], gender: params["gender"], id: 1}

    {:noreply, stream_insert(socket, :survivors, survivor)}
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Survivor")
    |> assign(:survivor, %{})
    |> assign(:form, to_form(%{}))
  end
end
