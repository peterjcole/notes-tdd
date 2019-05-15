require 'notebook'

describe 'notebook' do
  let(:notebook) { Notebook.new }
  let(:note) { Note.new("Shopping list", "Bread, milk, avocados")}
  context 'creating a notebook' do
    it 'can be created' do
      expect(notebook).to be_a(Notebook)
    end
  end

  context 'when adding notes to notebook' do
    it 'describes one note after adding a single note' do
      expect(notebook.add(note)).to eq('New note added to notebook. The notebook now contains 1 note')
    end
    it 'describes two notes after adding two notes' do
      notebook.add(note)
      expect(notebook.add(note)).to eq('New note added to notebook. The notebook now contains 2 notes')
    end 
  end
end