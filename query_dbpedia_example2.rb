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
#Find all Musical Artist Sopranos with the hometown as the US


query = %q(
PREFIX dbpedia2: <http://dbpedia.org/property/>
PREFIX dbowl: <http://dbpedia.org/ontology/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
SELECT ?person ?voiceType ?hometown
where {
?person rdf:type <http://dbpedia.org/ontology/MusicalArtist>.
?person dbpedia2:voiceType ?voiceType .
?person dbowl:hometown ?hometown .
?person dbowl:hometown <http://dbpedia.org/resource/United_States>
FILTER regex(?voiceType, "soprano", "i")
}
)


#creating query object
query = QueryFactory.create(query)
qexec = QueryExecutionFactory.sparql_service("http://dbpedia.org/sparql", query)

results = qexec.exec_select
while results.has_next
  result = results.next
  person = result.get("person").uri
  voice_type =  result.get("voiceType").string
  hometown = result.get("hometown").uri
  puts "#{person} #{voice_type} #{hometown}"
end
qexec.close





