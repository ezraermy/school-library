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
  end
end