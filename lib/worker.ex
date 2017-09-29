defmodule Edos.Worker do
  def loop(num) do
    receive do
      {sender_pid, {:msg, _msg}} ->
        send(sender_pid, {:ok, "gotcha"})
      # without "_ ->", the unmatched msg would stay
      # in the erlang VM mailbox forever...
    end
    #IO.puts "msg #{num} recevied but unmtached"
    loop(num+1)
  end
end
