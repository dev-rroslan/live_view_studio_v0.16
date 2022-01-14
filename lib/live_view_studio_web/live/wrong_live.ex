defmodule LiveViewStudioWeb.WrongLive do
  use LiveViewStudioWeb, :live_view
  def mount(_params, _session, socket) do
    {
      :ok,
      assign(
      socket,
      score: 0,
      message: "Guess a number.",
      answer: answer()
      )
      }
   end

  def render(assigns) do
    ~H"""

    <h1>Your score: <span class="text-red-800"><%= @score %></span></h1>
    <h2 class="text-center text-4xl font-semibold mb-8 text-indigo-700">
    <%= @message %>
    </h2>
    <h2 class="text-center italic hover:not-italic text-2xl mb-8">
    <%= for n <- 1..10 do %>
    <a href="#" phx-click = "guess" phx-value-number = {n}><%= n %></a>
    <% end %>
    </h2>
    """
  end

  def handle_event("guess", %{"number" => guess}, socket) do
    if guess == "#{socket.assigns.answer}" do
      {:noreply,
       assign(
         socket,
         score: socket.assigns.score + 5,
         message: "Your guess: #{guess}. Correct! Another Go",
         answer: answer()
       )}

      else
      {:noreply,
      assign(
        socket,
        score: socket.assigns.score - 1,
        message: "Your guess: #{guess}. Wrong! Try Again",
        answer: answer()
      )}
    end
  end
  def answer() do
    :rand.uniform(10)
  end
end
