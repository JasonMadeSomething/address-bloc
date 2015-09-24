require_relative '../models/address_book'

RSpec.describe AddressBook do
  let(:book) {AddressBook.new}
    
  def check_entry(entry, expected_name, expected_number, expected_email)
    expect(entry.name).to eql expected_name
    expect(entry.phone_number).to eql expected_number
    expect(entry.email).to eql expected_email
  end
  
  describe "attributes" do
    it "should respond to entries" do
      expect(book).to respond_to(:entries)
    end
        
    it "should initialize entries as an array" do
      expect(book.entries).to be_a(Array)
    end
        
    it "should initialize entries as empty" do
      expect(book.entries.size).to eq(0)
    end
  end
    
  describe "#add_entry" do
    it "adds only one entry to the address book" do
      book.add_entry('Ada Lovelace', "555-555-5555", "someaddress@gmail.com")
      expect(book.entries.size).to eq(1)
    end
        
    it "adds the correct information to entries" do
      book.add_entry('Ada Lovelace', "555-555-5555", "someaddress@gmail.com")
      new_entry = book.entries[0]
      expect(new_entry.name).to eq('Ada Lovelace')
      expect(new_entry.phone_number).to eq("555-555-5555")
      expect(new_entry.email).to eq("someaddress@gmail.com")
    end
  end
    
  describe "#import_from_csv" do
    it "imports the correct number of entries" do
      book.import_from_csv("entries.csv")
      book_size = book.entries.size
      expect(book_size).to eql 5
    end
       
    it "imports the 1st entry" do
      book.import_from_csv("entries.csv")
      check_entry(book.entries[0], "Bill", "555-555-4854", "bill@blocmail.com")
    end
    
    it "imports the 2nd entry" do
      book.import_from_csv("entries.csv")
      check_entry(book.entries[1], "Bob", "555-555-5415", "bob@blocmail.com")
    end
    it "imports the 3rd entry" do
      book.import_from_csv("entries.csv")
      check_entry(book.entries[2], "Joe", "555-555-3660", "joe@blocmail.com")
    end
    it "imports the 4th entry" do
      book.import_from_csv("entries.csv")
      check_entry(book.entries[3], "Sally", "555-555-4646", "sally@blocmail.com")
    end
    it "imports the 5th entry" do
      book.import_from_csv("entries.csv")
      check_entry(book.entries[4], "Sussie", "555-555-2036", "sussie@blocmail.com")
    end
    it "imports the correct number of entries from the alternate file" do
      book.import_from_csv("entries_2.csv")
      expect(book.entries.size).to eql 3
    end
    it "imports the 1st entry" do
      book.import_from_csv("entries_2.csv")
      check_entry(book.entries[0], "A", "555-555-5555","an@email.com")
    end
    it "imports the 2nd entry" do
      book.import_from_csv("entries_2.csv")
      check_entry(book.entries[1], "B", "155-555-5555","the@email.com")
    end
    it "imports the 3rd entry" do
      book.import_from_csv("entries_2.csv")
      check_entry(book.entries[2], "C", "255-555-5555","a@email.com")
    end
  end
end