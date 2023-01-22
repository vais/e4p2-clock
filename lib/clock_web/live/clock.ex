defmodule ClockWeb.Live.Clock do
  use ClockWeb, :live_view

  def mount(_params, _session, socket) do
    if connected?(socket), do: tick()
    {:ok, assign(socket, :time, time())}
  end

  def handle_info(:tick, socket) do
    if connected?(socket), do: tick()
    {:noreply, assign(socket, :time, time())}
  end

  defp time() do
    NaiveDateTime.local_now() |> NaiveDateTime.to_time() |> Time.to_string()
  end

  defp tick() do
    Process.send_after(self(), :tick, 1000)
  end

  def render(assigns) do
    ~L"""
    <div class="clock"><%= @time %></div>
    """
  end
end
