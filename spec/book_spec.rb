describe Book do
  context 'when initialized' do
    it 'has a title' do
      book = Book.new('title', 'author')
      expect(book.title).to eq('title')
    end
  end
end