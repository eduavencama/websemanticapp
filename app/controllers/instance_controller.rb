class InstanceController < ApplicationController
  def index

      sparql = SPARQL::Client.new("http://www.grupo1.semanticweb.uniandes.edu.co:8890/sparql")

      type = '<http://www.w3.org/1999/02/22-rdf-syntax-ns#type>'
      name = '<http://www.grupo1.semanticweb.uniandes.edu.co/curso/arte#name>'
      qname = ""
      offset=0
      limit=20

      if params[:name] && params[:name] != ''
        qname = '. FILTER regex(?name,"'+params[:name]+'"^^<http://www.w3.org/2001/XMLSchema#string>, "i")'
      end
      if params[:offset] && params[:offset] != ''
        offset = params[:offset]
      end
      if params[:limit] && params[:limit] != ''
        limit = params[:limit]
      end

      @q =    "SELECT ?uri ?name ?class
              WHERE { ?uri #{type} ?class .
                  ?uri  #{name} ?name #{qname} .
                  } offset #{offset} limit #{limit}"
      @query = sparql.query(@q)

  end
  end
