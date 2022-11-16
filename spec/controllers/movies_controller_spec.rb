require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  before(:all) do
    if Movie.where(director: "Jon Favreau").empty?
      Movie.create(title: "Iron Man", director: "Jon Favreau",
                   rating: "PG-13", release_date: "2008-05-02")
      Movie.create(title: "Spider-Man: Homecoming", director: "Jon Favreau",
                   rating: "PG-13", release_date: "2017-07-07")
    end

    if Movie.where(title: "Big Hero 6").empty?
      Movie.create(title: "Big Hero 6",
                   rating: "PG", release_date: "2014-11-07")
    end
  end

  ##### Part 3 #####
  # Write your tests here
  # describe "my feature" do
  describe "create" do
    it "add a movie to the movies table" do
      post 'create', movie: {title: "movie", director: "movie director",
      rating: "PG-13", release_date: "2009-06-01"}
      expect(Movie.where(title: "movie")).to exist
    end

    it "will still add movie if any field is missiong" do
      post 'create', movie: {title: "movie", rating: "PG-13", release_date: "2009-06-01"}
      expect(Movie.where(title: "movie")).to exist
    end
  end

  describe "destroy" do
    it "delete a movie in the movies table" do
      delete 'destroy', :id => Movie.where(title: "Iron Man").first.id
      expect(Movie.where(title: "Iron Man")).not_to exist
    end
  end
end
