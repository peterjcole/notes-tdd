require 'notebook'

describe 'notebook' do
  let(:notebook) { Notebook.new }
  let(:note) { Note.new("Shopping list", "Bread, milk, avocados") }
  let(:second_note) { Note.new("Who am I?", "What is my purpose?") }
  let(:notebook_with_notes) do 
    notebook = Notebook.new 
    notebook.add(note)
    notebook.add(second_note)
    return notebook
  end
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

  context 'when listing notes' do
    it 'lists the notes as a string' do
      expect(notebook_with_notes.list).to eq("Here are your note titles:\nShopping list\nWho am I?")
    end
  end
end