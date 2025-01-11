class Movies
  attr_reader :title, :duration, :age_rating, :release_date

  def initialize(id:nil, title:, duration:, age_rating:, release_date:)
    self.id = id
    self.title = title
    self.duration = duration
    self.age_rating = age_rating
    self.release_date = release_date
  end

  private

  def self.title_valid?(title)
    !title.nil? && title.match?(/\A[А-ЯЁа-яёA-Za-z0-9\s.,!?'-]{1,200}\z/)
  end

  def self.duration_valid?(duration)
    !duration.nil? && duration.match?(/\A[1-9][0-9]*\z/)
  end

  def self.age_rating_valid?(age_rating)
    !age_rating.nil? && age_rating.match?(/\A\d{1,2}\+\z/)
  end

  def self.release_date_valid?(release_date)
    !release_date.nil? && release_date.match?(/\A\d{2}-\d{2}-\d{4}\z/)
  end

  def self.id_valid?(id)
    id.nil? || id.to_s.match?(/\A[0-9]+\z/)
  end
  
  def title=(title)
    raise "Invalid title" if !Movies.title_valid?(title) 
    @title = title if Movies.title_valid?(title)
  end

  def duration=(duration)
    raise "Invalid duration" if !Movies.duration_valid?(duration) 
    @duration = duration if Movies.duration_valid?(duration)
  end

  def age_rating=(age_rating)
    raise "Invalid age_rating" if !Movies.age_rating_valid?(age_rating) 
    @age_rating = age_rating if Movies.age_rating_valid?(age_rating)
  end

  def release_date=(release_date)
    raise "Invalid release_date" if !Movies.release_date_valid?(release_date) 
    @release_date = release_date if Movies.release_date_valid?(release_date)
  end

end