class ClassController < ApplicationController
  def index

      sparql = SPARQL::Client.new("http://www.grupo1.semanticweb.uniandes.edu.co:8890/sparql")


      classUri = "<http://www.w3.org/2002/07/owl#Class>"
      artist = "<http://www.grupo1.semanticweb.uniandes.edu.co/curso/arte#Artist>"
      type = '<http://www.w3.org/1999/02/22-rdf-syntax-ns#type>'


      @clase = "Artist"
      qclass = artist
      name = '<http://www.grupo1.semanticweb.uniandes.edu.co/curso/arte#name>'
      qname = ""
      offset=0
      limit=20

      if params[:class] && params[:class] != ''
        qclass = "<"+params[:class]+">"
        @clase = params[:class].split('#')[1]
      end
      if params[:name] && params[:name] != ''
        qname = ', ?name FILTER(?name="'+params[:name]+'"^^<http://www.w3.org/2001/XMLSchema#string>)'
      end
      if params[:offset] && params[:offset] != ''
        offset = params[:offset]
      end
      if params[:limit] && params[:limit] != ''
        limit = params[:limit]
      end

      @qclasecount = "SELECT (COUNT(?instance) AS ?cuent ) WHERE { {?instance a #{qclass} .} }"
      @qclase = "SELECT DISTINCT ?clase  WHERE { {[] a ?clase .}}"
      @q =    "SELECT ?uri ?name
              WHERE { ?uri #{type} #{qclass} .
                  ?uri  #{name} ?name #{qname} .
                  } offset #{offset} limit #{limit}"


      @queryC = sparql.query(@qclase)
      @query = sparql.query(@q)
      @queryNum = sparql.query(@qclasecount)



  end


  end
