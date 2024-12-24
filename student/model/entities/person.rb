class Person
  attr_reader :id, :git

  def initialize(id:nil, git:nil)
    @id = id
    @git = git
  end

  def self.phone_number?(phone)
    phone.nil? || phone.match?(/\A(\+?7|8)\d{10}\z/)
  end

  def self.email_valid?(email)
    email.nil? || email.match?(/\A[a-zA-Z0-9_.+\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-.]+\z/)
  end

  def self.telegram_valid?(telegram)
    telegram.nil? || telegram.match?(/\A@[a-zA-Z0-9_]{5,}\z/)
  end

  def self.git_valid?(git)
    git.nil? || git.match?(/\A(https:\/\/)?github.com\/[a-zA-Z0-9_-]+\z/)
  end

  def self.id_valid?(id)
    id.nil? || id.to_s.match?(/\A[0-9]+\z/)
  end

  def self.fio_valid?(fio)
    !fio.nil? && fio.match?(/^[A-ZА-ЯЁ][a-zа-яё]*\z/)
  end

  def has_contact?
    !self.contact.nil?
  end

  def has_git?
    Person.git_valid?(@git)
  end

  def validate?
    has_git? && has_contact?
  end
  
  def contact
    raise ArgumentError, "No contacts"
  end
end