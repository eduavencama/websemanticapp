class ArtistController < ApplicationController

def index
   #@artists = Artist.where("SELECT ?label WHERE  { test:thing rdfs:label ?label  FILTER(LANG(?label) = "") }").limit(1).offset(0)
   # @artists  = Artist.where("DESCRIBE ?uri WHERE { SELECT DISTINCT ?uri (http://dbpedia.org as ?graph) WHERE { GRAPH http://dbpedia.org { ?uri a http://dbpedia.org/ontology/Book . ?uri ?p ?o } } LIMIT 5}")

    #@artists = Artist.where("?uri <http://dbpedia.org/property/name> ?name").limit(1).offset(0).order("DESC(?name)")
    #@artists = Artist.query('SELECT * WHERE {?s ?p ?o} LIMIT 10','')
    #@artists = Artist.all.limit(1)
    #@ric = Artist.find('http://dbpedia.org/page/Fernando_Botero')

        @artists = Artist.find_by_sparql('select ?uri
     WHERE {
       GRAPH <http://www.grupo1.semanticweb.uniandes.edu.co/curso/arte>
       { ?uri a <http://www.grupo1.semanticweb.uniandes.edu.co/curso/arte#Artist> } } limit 10')


end


end
