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

    <h1>Your score: <%= @score %></h1>
    <h1>
    <%= @message %>
    </h1>
    <h1>
    <%= for n <- 1..10 do %>
    <a href="#" phx-click = "guess" phx-value-number = {n}><%= n %></a>
    <% end %>
    </h1>
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
