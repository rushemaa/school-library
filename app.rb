require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'

class App
  attr_reader :books, :person, :rentals, :classroom

  def initialize
    @books = []
    @person = []
    @rentals = []
  end

  # List all books

  def books_lists()
    puts 'All Books:'
if @books.empty?
      puts 'No book available'
    else
        @books.each do |book|
        puts "Title: #{book.title}, Author: #{book.author}"
        end
    end
  end

  # List all people
  def people_list()
    puts 'All People:'
    if @person.empty?
      puts 'No people to show!'
    else
        @person.each do |pn|
            print "[#{pn.class}], Name: #{pn.name}, age: #{pn.age}, "
            if pn.instance_of?(Teacher)
                puts "Specialization: #{pn.specialization}"
            else
                puts "Permission: #{pn.parent_permission}"
            end
        end
    end
  end

  # Create a person
  def create_person()
    puts 'Enter (1) for Student (2) for Teacher'
    person_type = gets.chomp.to_i
    print 'Name:'
    name = gets.chomp
    print 'Age:'
    age = gets.chomp.to_i

    case person_type
    when 1
      print 'Parent permission [Y/N]: '
      permission = gets.chomp.downcase == 'y'? true : false
      @person.push(Student.new(age, 0, permission, name))

    when 2
      print 'Specialization: '
      specialization = gets.chomp
      permission =  true
      teacher = Teacher.new(age, specialization, permission , name)
      @person << teacher
    end

    puts 'Person created successfully!'
  end

  # Create a book
  def create_book
    puts 'Enter book title:'
    title = gets.chomp
    puts 'Enter book author:'
    author = gets.chomp

    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully.'
  end

  # Create a rental
  def create_rental
    puts 'Select book by number'
    @books.each_with_index do |book, index|
      puts "#{index} - Title: #{book.title}, Author: #{book.author}"
    end

    book_index = gets.chomp.to_i

    puts 'Select person by number'
    @person.each_with_index do |person, index|
      puts "#{index} - #{person.class}, Name: #{person.name}"
    end

    person_index = gets.chomp.to_i
    puts 'Enter date:'
    date = gets.chomp

    rental = Rental.new(date, @books[book_index], @person[person_index])
    @rentals << rental
    puts 'Rental created successfully.'
  end

  # Rentals list

  def list_rentals_for_person
    puts 'All rentals for given ID'
    @rentals.each do |rental|
      puts " #{rental.person.id}, Name: #{rental.person.name}"
    end
    puts 'Select id'
    id = gets.chomp.to_i

    puts 'All Rentals for selected ID:'
    @rentals.each do |rental|
      if rental.person.id == id
        puts "Title: #{rental.book.title}, Author: #{rental.book.author}, Date: #{rental.date}"

      else
        puts 'No Rental found for the selected ID '
      end
    end
  end
end