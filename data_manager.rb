require 'json'
require 'fileutils'

module DataManager
  def save_data
    create_data_directory
    save_books
    save_people
    save_rentals
  end

  DATA_DIR = 'data'.freeze
  BOOKS_FILE = "#{DATA_DIR}/books.json".freeze
  PEOPLE_FILE = "#{DATA_DIR}/people.json".freeze
  RENTALS_FILE = "#{DATA_DIR}/rentals.json".freeze

  def create_data_directory
    FileUtils.mkdir_p(DATA_DIR) unless Dir.exist?(DATA_DIR)
  end

  def save_books
    book_data = @books.map { |book| { 'title' => book.title, 'author' => book.author } }
    File.open(BOOKS_FILE, 'w') do |file|
      file.write(JSON.generate(book_data))
    end
  end
  

  def save_people
    people_data = @people.map do |person|
      attributes = person.attributes
      attributes['classroom'] = person.classroom.name if person.is_a?(Student) && person.classroom.is_a?(Classroom)
      attributes
    end
  
    File.open(PEOPLE_FILE, 'w') do |file|
      file.write(JSON.generate(people_data))
    end
  end  

  def save_rentals
    File.open(RENTALS_FILE, 'w') do |file|
      file.write(JSON.generate(@rentals))
    end
  end
end
