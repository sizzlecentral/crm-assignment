class Contact

  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note

  @@contacts = []
  @@id = 1

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end

# ----- Class Methods ----- #

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    contact = Contact.new(first_name, last_name, email, note)
    @@contacts << contact
    return contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.each do |contact|
      if id == contact.id
        return contact
      end
    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(first_name)
    @@contacts.each do |contact|
      if first_name == contact.first_name
        return contact
      # elsif
      #   last_name == contact.last_name
      #   return contact
      # elsif
      #   email == contact.email
      #   return contact
      # elsif
      #   note == contact.note
      #   return contact
      # else
      #   return "Contact not found."
      end
    end
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts.clear
  end


# ----- Instance Methods ----- #

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
  end

  # Feel free to add other methods here, if you need them.

end

# ----- End of Contact class ----- #

instantiate = Contact.create("Bob", "Jones", "bob@jones.com", "Bob is cool.")
sally = Contact.create("Sally", "Smith", "sally@smith.com", "Sally is okay.")

# p Contact.all
# p Contact.find(2)
# p Contact.find_by("Bob") # How to search by any attribute?
# Contact.delete_all
# p Contact.all
