require 'irb'
require_relative 'contact'
require_relative 'crm'

a_crm_app = CRM.new("My CRM")
a_crm_app.main_menu

# instantiate = Contact.create("Bob", "Jones", "bob@jones.com", "Bob is cool.")
# sally = Contact.create("Sally", "Smith", "sally@smith.com", "Sally is okay.")
#
# a_crm_app.search_by_attribute
# p Contact.all
