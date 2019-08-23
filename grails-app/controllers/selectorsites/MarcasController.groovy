package selectorsites

import groovy.json.JsonSlurper

class MarcasController {

    def index() { }

    def create (params) {

        def data = '{ ' +
                "\"name\":"+"\""+ params.name+"\"}"

        println(data)
        def url = new URL("http://localhost:8080/marcas/");
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
}
