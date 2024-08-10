class AddressBook
    def initialize
      @contacts = {}
    end
  
    def add_contact(name, phone_number)
      if @contacts.key?(name)
        puts "Contact already exists. Use 'update_contact' to modify it."
      else
        @contacts[name] = phone_number
        puts "#{name} has been added to the address book."
      end
    end
  
    def list_contacts
      if @contacts.empty?
        puts "No contacts found."
      else
        @contacts.each do |name, phone_number|
          puts "#{name}: #{phone_number}"
        end
      end
    end
  
    def find_contact(name)
      if @contacts.key?(name)
        puts "#{name}: #{@contacts[name]}"
      else
        puts "Contact not found."
      end
    end
  
    def update_contact(name, new_phone_number)
      if @contacts.key?(name)
        @contacts[name] = new_phone_number
        puts "#{name}'s phone number has been updated."
      else
        puts "Contact not found. Use 'add_contact' to add it first."
      end
    end
  
    def delete_contact(name)
      if @contacts.key?(name)
        @contacts.delete(name)
        puts "#{name} has been removed from the address book."
      else
        puts "Contact not found."
      end
    end
  
    def menu
        puts "\n------------------"
        puts "Address Book Menu:"
        puts "------------------"

      loop do
        puts "\n1. Add Contact"
        puts "2. List Contacts"
        puts "3. Find Contact"
        puts "4. Update Contact"
        puts "5. Delete Contact"
        puts "6. Exit"
        print "Choose an option (1-6): "
        choice = gets.chomp.to_i
  
        case choice
        when 1
          print "Enter contact name: "
          name = gets.chomp
          print "Enter phone number: "
          phone_number = gets.chomp
          add_contact(name, phone_number)
        when 2
          list_contacts
        when 3
          print "Enter contact name to find: "
          name = gets.chomp
          find_contact(name)
        when 4
          print "Enter contact name to update: "
          name = gets.chomp
          print "Enter new phone number: "
          new_phone_number = gets.chomp
          update_contact(name, new_phone_number)
        when 5
          print "Enter contact name to delete: "
          name = gets.chomp
          delete_contact(name)
        when 6
          puts "Exiting..."
          break
        else
          puts "Invalid choice. Please select a number between 1 and 6."
        end
      end
    end
  end
  
  address_book = AddressBook.new
  address_book.menu
  