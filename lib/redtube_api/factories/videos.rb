# Module to hold the RedTube API Client
module RedtubeApi
  # Class is to withhold the information related to a RedTube video.
  class Video
    attr_reader :size, :duration, :views, :video_id, :rating, :ratings, :title, :url, :embed_url,
                :media, :publish_date,
    def initialization(config = {})
      @size = config[:size]
      @duration = config[:duration]
      @views = config[:views]
      @video_id = config[:video_id]
      @rating = config[:rating]
      @ratings = config[:ratings]
      @title = config[:title]
      @url = config[:url]
      @embed_url = config[:embed_url]
      @default_thumb = config[:default_thumb]
      @thumb = config[:thumb
      @thumbs = config[:thumbs]
      @publish_date = config[:publish_date]
    end

    def excellent?
      @rating == 5
    end

    def great?
      @rating <= 4
    end

    def good?
      @rating <= 3
    end

    def ok?
      @rating <= 2
    end

    def poor?
      @rating <= 1
    end

    def arse?
      @rating == 0
    end
  end
end
