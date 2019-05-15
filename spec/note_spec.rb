require 'note'

describe 'note' do
  let(:note) { Note.new }

  context 'when creating, then setting, note' do
    it 'lets the user know they have created a note' do
      expect(note.set("Shopping list", "Bread, milk, avocados")).to eq("New note created. Title: Shopping list. Body: Bread, milk, avocados")
    end
    it 'allows access to the note title' do
      note.set("Shopping list", "Bread, milk, avocados") 
      expect(note.title).to eq("Shopping list")
    end
    it 'allows access to the note body' do
      note.set("Shopping list", "Bread, milk, avocados") 
      expect(note.body).to eq("Bread, milk, avocados")
    end
  end

  context 'when initialising a note with a title and body' do
    it 'returns a note' do
      expect(Note.new("Shopping list", "Bread, milk, avocados")).to be_a(Note)
    end
    it 'allows access to the note title' do
      note = Note.new("Shopping list", "Bread, milk, avocados") 
      expect(note.title).to eq("Shopping list")
    end
    it 'allows access to the note body' do
      note = Note.new("Shopping list", "Bread, milk, avocados") 
      expect(note.body).to eq("Bread, milk, avocados")
    end  
  end

end