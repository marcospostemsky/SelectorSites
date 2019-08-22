<!doctype html>
<html>
<head>
    <meta name="layout" content="test"/>
    <script src="https://unpkg.com/vue/dist/vue.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <style>
        .navbtn:hover {
            cursor: pointer;
            cursor: hand;
            color: #005cbf;
        }

        .navsite:hover {
            cursor: pointer;
            cursor: hand;
            color: #1403bf;
        }
        td {
            padding: 5px 10px;
            text-align: center;
            border: 1px solid #999;
        }

        div.centerTable{
            text-align: center;
        }

        div.centerTable table {
            margin: 0 auto;
            text-align: left;
        }

        body, html {
            font-family: "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
            padding: 0;
            margin: 0;
            background: #ffff79;
            color: #343437;
            line-height: 25px;
            font-weight: normal;
            font-size: 14px;
        }

    </style>

</head>
<body>

<select id="sites" onchange="devuelveSite(this.value)" style="width: 30%;font-size: 20px;margin-bottom: 3px;margin-left: 5px; margin-top: 10px">
    <g:each in="${sites}" var="site">
        <option id="site" value="${site?.id}">${site?.name}</option>
    </g:each>
</select>

<div id="tabla" style="width: 100%;">

    <div id="div1" style="margin-left: 10px;color:#062c33;font-size:15px;font-weight:bold">
    </div>
    <div id="divPath" style="margin-left:10px;color: #cc0000;">
        <span class="navbtn" @click="devuelveCategories(path.id)" v-for="path in paths">{{path.name}} -> </span>
    </div>

    <div id="divCategories" class="centerTable">
        <table border="1" id="tabCategories" style="width: 30%;">
            <thead>
            <tr>
                <td style="font-size: 25px;background-color: #fee92a"><b>Categorías</b></td>
            </tr>
            </thead>
            <tr v-for="category in categories">
                <td>

                    <A href="#" @click="devuelveCategories(category.id)">
                         {{category.name}}
                </A>

                </td>
            </tr>
        </table>
    </div>



    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Última categoría hija</h4>
                </div>
                <div class="modal-body">

                   <ul>
                       <li>ID: {{category.id}}</li>
                       <li>Name: {{category.name}}</li>
                       <li>Items totales: {{category.total_items_in_this_category}}</li>
                       <img id="imagen" style="width:300px;height:300px;">
                   </ul>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div>

        </div>
    </div>



</div>



<script>

    var tabla = new Vue( {
        el: '#tabla',
        data: {
            categories: [],
            category: [],
            paths: []
        },
        methods: {
            fetchData: function(site) {
                axios.get('/sites/getSites', {
                    params: {
                        site:site
                    }
                }).then(function(response) {
                    tabla.categories = response.data.categories;
                    document.getElementById("divPath").style.display="none"
                    document.getElementById("divCategories").style.display="inline"
                }).catch(function (error) {
                    console.log(error)
                })
            },
            fetchDataCategories: function (category) {
                axios.get('/sites/getCategories', {
                    params: {
                        category:category
                    }
                }).then(function(response) {
                    document.getElementById("divPath").style.display="inline"
                    document.getElementById("divCategories").style.display="inline"
                    if (response.data.categories.children_categories.length == 0) {
                        tabla.category = response.data.categories
                        document.getElementById("divCategories").style.display="none"
                        if(tabla.category.picture!=null) {
                            document.getElementById("imagen").src = tabla.category.picture
                        } else {
                            document.getElementById("imagen").src = "https://i.pinimg.com/originals/f3/04/44/f3044417b8ba1996d025ec3b0d7675ba.jpg"
                        }
                        $("#myModal").modal()
                    }

                    tabla.categories = response.data.categories.children_categories;
                    tabla.paths = response.data.categories.path_from_root

                }).catch(function (error) {
                    console.log(error)
                })

            }
        },
        created: function() {
            this.fetchData(document.getElementById("sites").value)
            var seleccion = document.getElementById("sites");
            document.getElementById("div1").innerHTML = '<span class="navsite" onclick="devuelveSite('+"'"+seleccion.value+"'"+')">'+seleccion.options[seleccion.selectedIndex].text+'</span>'
        }

    })

    function devuelveSite(site) {
        //var site = document.getElementById("sites").value
        tabla.fetchData(site)
        var seleccion = document.getElementById("sites");
        document.getElementById("div1").innerHTML = '<span class="navsite" onclick="devuelveSite('+"'"+site+"'"+')">'+seleccion.options[seleccion.selectedIndex].text+'</span>'
    }

    function devuelveCategories(category) {
       tabla.fetchDataCategories(category)
    }



</script>




</body>
</html>