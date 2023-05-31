require_relative '../book'

describe Book do
  context 'when initialized' do
    it 'has a title' do
      book = Book.new('title', 'author')
      expect(book.title).to eq('title')
    end
    it 'has an author' do
      book = Book.new('title', 'author')
      expect(book.author).to eq('author')
    end
    it 'has an empty array of rentals' do
      book = Book.new('title', 'author')
      expect(book.rentals).to eq([])
    end
  end
end