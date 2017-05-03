class MovieController < ApplicationController
    @@api_url='http://www.omdbapi.com/?t='
    def index
        require('json')
        require('open-uri')
        #여기까지
        
        #forms에서 입력받은 제목을 가져온다
        @movie_title=params[:title]
        #api_url끝에 제목을 붙여서 주소를 새로 만들어준다
        movie_search=@@api_url+@movie_title.to_s
        
        open_page=open(movie_search)
        movie_info = open_page.read
        movie_hash = JSON.parse(movie_info)
        
        newMovie = Moviepost.new
        newMovie.title = movie_hash["Title"]
        newMovie.released = movie_hash["Released"]
        newMovie.poster = movie_hash["Poster"]
        newMovie.save
        
        @movie_title=movie_hash["Title"]
        @movie_released=movie_hash["Released"]
        @movie_poster=movie_hash["Poster"]
    end
    
end
