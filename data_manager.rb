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

  def load_data
    load_books
    load_people
    load_rentals
  end

  def load_books
    book_data = load_data_from_file(BOOKS_FILE)
    @books = book_data.nil? ? [] : book_data.map { |book_info| Book.new(book_info['title'], book_info['author']) }
  end   

  def load_people
    people_data = load_data_from_file(PEOPLE_FILE)
    @people = people_data.nil? ? [] : people_data.map do |person_info|
      if person_info['role'] == 'student'
        student = Student.new(person_info['age'], person_info['name'], parent_permission: person_info['parent_permission'])
        student.role = 'student'
        student
      else
        teacher = Teacher.new(person_info['age'], person_info['specialization'], person_info['name'])
        teacher.role = 'teacher'
        teacher
      end
    end
  end
end
