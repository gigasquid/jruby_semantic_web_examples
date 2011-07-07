require 'javalib/jena-2.6.4.jar'
require 'javalib/icu4j-3.4.4.jar'
require 'javalib/iri-0.8.jar'
require 'javalib/log4j-1.2.13.jar'
require 'javalib/slf4j-api-1.5.8.jar'
require 'javalib/slf4j-log4j12-1.5.8.jar'
require 'javalib/xercesImpl-2.7.1.jar'
require 'java'

java_import 'com.hp.hpl.jena.rdf.model.ModelFactory'
java_import 'com.hp.hpl.jena.rdf.model.SimpleSelector'
java_import 'com.hp.hpl.jena.util.FileManager'
java_import 'com.hp.hpl.jena.vocabulary.VCARD'
java_import 'java.io.InputStream'

#Tutorial 8 - demonstrate Selector methods

#Creating a model 
model = ModelFactory.create_default_model

#Finding the input file using the Jena File Manager
input_file = FileManager.get.open "sample_input.rdf"

#read the RDF/XML file
model.read(input_file, nil)

#select all the resources with a VCARD.FN property
iter = model.list_resources_with_property VCARD::FN
puts "The database contains vcards for:"
while iter.has_next
  puts iter.next_resource.get_required_property(VCARD::FN).string
end

#select all the resources with a VCARD.FN property whose value ends
#with Smith

class MySelector < SimpleSelector
  def selects(statement)
    if statement.string.include?("Smith")
      return true
    else
      return false
    end
  end
end


selector = MySelector.new(nil, VCARD::FN, nil)

iter = model.list_statements(selector)
puts "When using a selector for Smith we get:"
while iter.has_next
  puts iter.next_statement.string
end









