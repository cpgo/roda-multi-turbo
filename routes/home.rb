# frozen_string_literal: true

App.hash_path '/home' do |r|
    r.on accept: 'text/html' do
      view('hello')
    end
    r.on accept: 'text/vnd.turbo-stream.html' do
      render('hello')
    end
    r.on do
      view('hello')
    end
  end
