defmodule Edos do
  def main(_args) do
    worker_pid = spawn(Edos.Worker, :loop, [0])

    # Test the worker
    send(worker_pid, {self(), {:msg, "hello"}})
    receive do
      {:ok, resp} ->
	IO.puts "Worker responed with #{resp}"
      _ ->
	IO.puts "Worker The Fuck..."
    end

    # Start flooding
    IO.puts "Start flooding..."
    attack(worker_pid, 1)
  end

  defp attack(wpid, num) do
    msg = "daveti: should be a very very very long msg..."
    send(wpid, msg)
    IO.puts "msg #{num} sent"
    #IO.puts "worker number of msg in the mailbox #{inspect Process.info(wpid, :messages)}"
    IO.puts "worker msg queue len #{inspect Process.info(wpid, :message_queue_len)}"
    attack(wpid, num+1)
  end
end
