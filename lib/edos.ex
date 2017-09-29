defmodule Edos do
  def attack() do
    worker_pid = spawn(Edos.Worker, :loop, 0)

    # Test the worker
    {:ok, resp} = send(worker_pid, {:msg, "hello"})
    IO.puts "Worker responed with #{resp}"

    # Start flooding
    IO.puts "Start flooding..."
    flood(worker_pid)
  end

  defp flood(wpid) do
    msg = "daveti: should be a very very very long msg..."
    send(wpid, msg)
    flood(wpid)
  end
end
