module Scrabble
end

require 'sinatra'
require_relative "./lib/scoring"


class ScrabbleSinatra < Sinatra::Base

  get "/" do
    erb :index
  end


  get "/score" do
    erb :score
  end

  post "/score" do
    @wordscore = Scrabble::Scoring.score(params["word"])
    @word = params["word"]
    erb :score
  end

  get "/score-many" do
    erb :score_many
  end

  post "/score-many" do
    @scores = Scrabble::Scoring.score_many(params["words"])
    erb :score_many
  end
  
  get "/:word" do
    @wordscore = Scrabble::Scoring.score(params[:word])
    @word = params[:word]
    erb :score
  end

  run!
end