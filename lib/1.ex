defmodule AcmeUdpLogger do
  use Application
  def start(_type, _args) do
     import Supervisor.Spec, warn: false

     children = [
                  # We will add our children here later
                  AcmeUdpLogger.MessageReceiver 
                 ]
                      
      # Start the main supervisor, and restart failed children individually
      opts = [strategy: :one_for_one, name: AcmeUdpLogger.Supervisor]
      Supervisor.start_link(children, opts)
   end
end
