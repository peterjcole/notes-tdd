class Notebook
  def initialize
    @notes = []
  end
  def add(note)
    @notes.push(note)
    return "New note added to notebook. The notebook now contains #{format_num_notes}"
  end
  private
  def format_num_notes
    "#{@notes.length} #{@notes.length == 1 ? "note" : "notes"}"
  end
end