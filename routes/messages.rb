# frozen_string_literal: true

App.hash_path '/messages' do |r|
    sleep 2
    r.on accept: 'text/html' do
      view('messages')
    end
    r.on accept: 'text/vnd.turbo-stream.html' do
      render('messages')
    end
  end
