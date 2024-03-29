package selectorsites

import grails.converters.JSON
import groovy.json.JsonSlurper

class SitesController {

    def index() {
        def url = new URL("http://localhost:8080/marcas")
        def connection = (HttpURLConnection) url.openConnection()
        connection.setRequestMethod("GET")
        connection.setRequestProperty("Accept","application/json")
        connection.setRequestProperty("User-Agent","Mozilla/5.0")
        JsonSlurper json = new JsonSlurper()
        def sites = json.parse(connection.getInputStream())
        [sites:sites,defecto:3]
    }

    def getSites(String site){
        def url = new URL("http://localhost:8080/marcas/"+site+"/articulos")
        def connection = (HttpURLConnection) url.openConnection()
        connection.setRequestMethod("GET")
        connection.setRequestProperty("Accept","application/json")
        connection.setRequestProperty("User-Agent","Mozilla/5.0")
        JsonSlurper json = new JsonSlurper()
        def categories = json.parse(connection.getInputStream())
        def resultado = [categories:categories]
        render resultado as JSON
    }

    def getCategories(String category){
        def url = new URL("http://localhost:8080/articulos/"+category)
        def connection = (HttpURLConnection) url.openConnection()
        connection.setRequestMethod("GET")
        connection.setRequestProperty("Accept","application/json")
        connection.setRequestProperty("User-Agent","Mozilla/5.0")
        JsonSlurper json = new JsonSlurper()
        def categories = json.parse(connection.getInputStream())
        def resultado = [categories:categories]
        render resultado as JSON
    }

}
