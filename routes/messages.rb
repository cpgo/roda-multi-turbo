# frozen_string_literal: true

class App
  hash_path "/messages" do |r|
    r.on accept: "text/html" do
      sleep 5 # pretend its a long running query
      view("messages")
    end
    r.on accept: "text/vnd.turbo-stream.html" do
      render("messages")
    end
  end

  hash_path "/messages/stream" do |r|
    r.get do
      # "Upgrade" the connection to an SSE
      response["Content-Type"] = "text/event-stream; utf-8"
      response["Cache-Control"] = "no-cache"
      response["Transfer-Encoding"] = "chuncked"
      response["Keep-Alive"] = "timeout=5"
      response["X-Accel-Buffering"] = "no"

      stream do |out|
        %w[a b c].each do |v|
          message = "event: custom-event\n" + "id: #{rand}\n" + "data: #{v}\n\n"
          out << message
          sleep 1
        end
      end
    end
  end
end
