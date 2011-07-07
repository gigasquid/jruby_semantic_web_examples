require 'javalib/jena-2.6.4.jar'
require 'javalib/icu4j-3.4.4.jar'
require 'javalib/iri-0.8.jar'
require 'javalib/log4j-1.2.13.jar'
require 'javalib/slf4j-api-1.5.8.jar'
require 'javalib/slf4j-log4j12-1.5.8.jar'
require 'javalib/xercesImpl-2.7.1.jar'
require 'java'

java_import 'com.hp.hpl.jena.vocabulary.RDFS'
java_import 'com.hp.hpl.jena.rdf.model.ModelFactory'

#Tutorial 11 - more on literals

#Creating a model 
model = ModelFactory.create_default_model
r = model.create_resource

r.add_property(RDFS::label, model.create_literal("chat", "en"))
r.add_property(RDFS::label, model.create_literal("chat", "fr"))
r.add_property(RDFS::label, model.create_literal("<em>chat</em>", "en"))
model.write(java.lang.System::out, "N-TRIPLE")

model = ModelFactory.create_default_model
r = model.create_resource
r.add_property(RDFS::label, "11")
r.add_literal(RDFS::label, 11)
model.write(java.lang.System::out, "N-TRIPLE")




