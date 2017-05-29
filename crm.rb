require_relative 'contact'

class CRM

  def initialize(name)
    puts name
    @name = name
  end

  def main_menu
    while true
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number'
    puts
  end

  def call_option(user_selected)
    case user_selected
      when 1 then add_new_contact
      when 2 then modify_existing_contact
      when 3 then delete_contact
      when 4 then display_all_contacts
      when 5 then search_by_attribute
      when 6 then exit
    end
  end

  def add_new_contact
    print 'Enter first name: '
    first_name = gets.chomp
    print 'Enter last name: '
    last_name = gets.chomp
    print 'Enter email address: '
    email = gets.chomp
    print 'Enter a note: '
    note = gets.chomp
    contact = Contact.create(
      first_name: first_name,
      last_name:  last_name,
      email:      email,
      note:       note
    )
    print 'The new contact has been added.'
    puts
    puts
  end

  def modify_existing_contact
    print 'Please enter an id for the contact to be modified: '
    id = gets.chomp.to_i
    contact = Contact.find(id)
    print 'Please enter the attribute you would like to modify: first name, last name, email or note: '
    attribute = gets.chomp
    print 'Please enter the new value to be saved: '
    value = gets.chomp
    contact.update(attribute, value)
    print 'The new information has been saved.'
    puts
    puts
  end

  def delete_contact
    print 'Please enter an id for the contact to be deleted: '
    id = gets.chomp.to_i
    contact = Contact.find(id)
    contact.delete
    print 'The contact has been deleted.'
    puts
    puts
  end

  def display_all_contacts
    p Contact.all
  end

  def search_by_attribute
    print 'Please enter the attribute you would like search by: first name, last name, email or note: '
    attribute = gets.chomp
    print 'Please enter the value to search for: '
    value = gets.chomp
    contact = Contact.find_by(attribute, value)
    print contact
    puts
    puts
  end

end

at_exit do
  ActiveRecord::Base.connection.close
end
# ----- End of CRM class ----- #
