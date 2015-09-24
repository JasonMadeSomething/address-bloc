require_relative '../models/address_book'

RSpec.describe AddressBook do
    describe "attributes" do
        it "should respond to entries" do
           book = AddressBook.new
           expect(book).to respond_to(:entries)
        end
        
        it "should initialize entries as an array" do
            book = AddressBook.new
            expect(book.entries).to be_a(Array)
        end
        
        it "should initialize entries as empty" do
            book = AddressBook.new
            expect(book.entries.size).to eq(0)
        end
    end
    
    describe "#add_entry" do
        it "adds only one entry to the address book" do
            book = AddressBook.new
            book.add_entry('Ada Lovelace', "555-555-5555", "someaddress@gmail.com")
            
            expect(book.entries.size).to eq(1)
        end
        
        it "adds the correct information to entries" do
            book = AddressBook.new
            book.add_entry('Ada Lovelace', "555-555-5555", "someaddress@gmail.com")
            new_entry = book.entries[0]
            expect(new_entry.name).to eq('Ada Lovelace')
            expect(new_entry.phone_number).to eq("555-555-5555")
            expect(new_entry.email).to eq("someaddress@gmail.com")
        end
    end
    describe "#remove_entry" do
        it "removes a single entry from the address book" do
            book = AddressBook.new
            book.add_entry('Ada Lovelace', "555-555-5555", "someaddress@gmail.com")
            book.add_entry('Bob', "555-555-5555", "someaddress@gmail.com")
            book.remove_entry('Ada Lovelace', "555-555-5555", "someaddress@gmail.com")
            expect(book.entries.size).to eq(1)
        end
    end
end