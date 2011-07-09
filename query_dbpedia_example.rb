require 'javalib/jena-2.6.4.jar'
require 'javalib/arq-2.8.8.jar'
require 'javalib/icu4j-3.4.4.jar'
require 'javalib/iri-0.8.jar'
require 'javalib/log4j-1.2.13.jar'
require 'javalib/slf4j-api-1.5.8.jar'
require 'javalib/slf4j-log4j12-1.5.8.jar'
require 'javalib/xercesImpl-2.7.1.jar'
require 'java'

java_import 'com.hp.hpl.jena.query.QueryFactory'
java_import 'com.hp.hpl.jena.query.QueryExecutionFactory'

#Querying Dbpedia


query = %q(
PREFIX dbo: <http://dbpedia.org/ontology/>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX dc: <http://purl.org/dc/elements/1.1/>
PREFIX : <http://dbpedia.org/resource/>
PREFIX dbpedia2: <http://dbpedia.org/property/>
PREFIX dbpedia: <http://dbpedia.org/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
SELECT ?name ?birth ?description ?person WHERE {
     ?person dbo:birthPlace :Berlin .
     ?person <http://purl.org/dc/terms/subject> <http://dbpedia.org/resource/Category:German_musicians> .
     ?person dbo:birthDate ?birth .
     ?person foaf:name ?name .
     ?person rdfs:comment ?description .
     FILTER (LANG(?description) = 'en') .
}
ORDER BY ?name)

#creating query object
query = QueryFactory.create(query)
qexec = QueryExecutionFactory.sparql_service("http://dbpedia.org/sparql", query)

results = qexec.exec_select
while results.has_next
  result = results.next
  name = result.get("name").string
  birth =  result.get("birth").string
  description = result.get("description").string
  uri = result.get("person").get_uri
  puts "#{name} #{birth} #{uri}"
  puts "    #{description}\n"
end
qexec.close





