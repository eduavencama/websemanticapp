class PropertyController < ApplicationController
  def index

      sparql = SPARQL::Client.new("http://www.grupo1.semanticweb.uniandes.edu.co:8890/sparql")


      propertyUri1 = "<http://www.w3.org/2002/07/owl#ObjectProperty>"
      propertyUri1 = "<http://www.w3.org/2002/07/owl#DatatypeProperty>"
      birthDate = "<http://www.grupo1.semanticweb.uniandes.edu.co/curso/arte#birthDate>"
      type = '<http://www.w3.org/1999/02/22-rdf-syntax-ns#type>'


      @propiedad = "birthDate"
      qproperty = birthDate
      name = '<http://www.grupo1.semanticweb.uniandes.edu.co/curso/arte#name>'
      qname = ""
      offset=0
      limit=20

      if params[:property] && params[:property] != ''
        qproperty = "<"+params[:property]+">"
        @propiedad = params[:property].split('#')[1]
      end
      if params[:name] && params[:name] != ''
        qname = '. FILTER regex(?name,"'+params[:name]+'"^^<http://www.w3.org/2001/XMLSchema#string>, "i")'
      end
      if params[:offset] && params[:offset] != ''
        offset = params[:offset]
      end
      if params[:limit] && params[:limit] != ''
        limit = params[:limit]
      end

      @qobjetocount = "SELECT (COUNT(DISTINCT ?o) AS ?objeto)
                        WHERE
                          {
                            ?s ?p ?o , ?p FILTER(?p='#{qproperty}').
                        }"
      @qpropiedad = "SELECT DISTINCT ?p AS ?propiedad  WHERE { {?s ?p ?o .}}"
      @q =    "SELECT ?uri ?name ?obj
              WHERE { ?uri #{qproperty} ?obj .
                  ?uri  #{name} ?name #{qname} .
                  } offset #{offset} limit #{limit}"


      @queryC = sparql.query(@qpropiedad)
      @query = sparql.query(@q)
      #@queryNum = sparql.query(@qobjetocount)



  end


  end
