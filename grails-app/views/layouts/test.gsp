<!doctype html>
<html lang="en" class="no-js">
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Categorías Mercado Libre"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="shortcut icon" href="https://http2.mlstatic.com/ui/navigation/4.5.2/mercadolibre/favicon.ico"/>

    <asset:stylesheet src="application.css"/>

   
    <g:layoutHead/>
</head>

<body>

 <style>
        h1 {
            display: block;
            font-size: 2.5em;
            margin-top: 0.67em;
            margin-bottom: 0.67em;
            margin-left: 2em;
            margin-right: 0;
            color: #fee92a;
        }

        table, th, td {
          border: 2px solid black;
          align-content: center;
        }
   </style>


<nav class="navbar navbar-expand-lg navbar-dark navbar-static-top" role="navigation">
    <img src="https://http2.mlstatic.com/ui/navigation/4.5.2/mercadolibre/favicon.ico" alt="Mercado Libre Logo"/>
    <h1 > Categorias de Mercado Libre</h1>
    <button style="margin-left: 400px" type="button" class="btn btn-success" data-toggle="modal" data-target="#ModalMarcaCreate">
    Crear marca </button>


    <div class="modal" id="ModalMarcaCreate" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="CreateModalLabel"> Crear marca</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <div class="modal-body" id="createMarca">

                        <g:form controller="marcas" action="create">
                            <input type="hidden" name="marca" :value=sites.value>
                            Nombre de la nueva marca:<br>
                            <input type="text" name="name" value="Marca">
                            <br><br>
                            <input type="submit" class="btn btn-success" value="Crear">
                        </g:form>

                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>




</nav>

<g:layoutBody/>


<div class="footer row" role="contentinfo">
    <div class="col">
        <strong class="centered">IT Academy</strong>
        <p>Aquí puede encontrar el repositorio de esta aplicación <a href="https://github.com/marcospostemsky/SelectorSites" target="_blank">GitHub Repository</a></p>

</div>



<asset:javascript src="application.js"/>

</body>
</html>
