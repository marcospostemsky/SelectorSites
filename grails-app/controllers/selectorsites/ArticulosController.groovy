package selectorsites

import grails.converters.JSON
import groovy.json.JsonSlurper

class ArticulosController {

    def index() { }

    def edit (params) {
        def data = '{ ' +
                "\"name\":"+"\""+ params.name+"\","+
                "\"picture\":"+"\""+ params.picture+"\","+
                "\"total_items_in_this_category\":"+"\""+ params.total_items_in_this_category+"\",}"

        def url = new URL("http://localhost:8080/articulos/"+params.idArticulo);
        def conn = (HttpURLConnection) url.openConnection()
        conn.setDoOutput(true);
        conn.setDoInput(true);
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setRequestProperty("Accept", "application/json");
        conn.setRequestMethod("PUT");
        OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
        wr.write(data);
        wr.flush();
        JsonSlurper json = new JsonSlurper()

        def items = json.parse(conn.getInputStream())

        redirect action: 'index', controller: 'sites'

    }


    def create (params) {

        def data = '{ ' +
                "\"name\":"+"\""+ params.name+"\","+
                "\"picture\":"+"\""+ params.picture + "\","+
                "\"total_items_in_this_category\":"+"\""+ params.total_items_in_this_category+"\"," +
                "\"marca\":"+"\""+ params.marca +"\"}"

        println(data)
        def url = new URL("http://localhost:8080/articulos/");
        def conn = (HttpURLConnection) url.openConnection()
        conn.setDoOutput(true);
        conn.setDoInput(true);
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setRequestProperty("Accept", "application/json");
        conn.setRequestMethod("POST");
        OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
        wr.write(data);
        wr.flush();
        JsonSlurper json = new JsonSlurper()
        def items = json.parse(conn.getInputStream())
        redirect action: 'index', controller: 'sites'
    }

    def delete (String articulo){
            def url = new URL("http://localhost:8080/articulos/"+articulo)
            def connection = (HttpURLConnection) url.openConnection()
            connection.setRequestMethod("DELETE")
            connection.setRequestProperty("Accept","application/json")
            connection.setRequestProperty("User-Agent","Mozilla/5.0")
            JsonSlurper json = new JsonSlurper()
            connection.getInputStream()
            render  connection.responseCode
    }

   /* private def articulosJSON(params){

    }*/
}
