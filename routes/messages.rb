# frozen_string_literal: true

App.hash_path "/messages" do |r|
  r.on accept: "text/html" do
    sleep 5 # pretend its a long running query
    view("messages")
  end
  r.on accept: "text/vnd.turbo-stream.html" do
    render("messages")
  end
end
