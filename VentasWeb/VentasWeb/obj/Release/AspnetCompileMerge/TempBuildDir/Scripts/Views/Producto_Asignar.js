
var tabladata;
var tablatienda;
var tablaproducto;


$(document).ready(function () {
    activarMenu("Compras");


    ////validamos el formulario
    $("#form").validate({
        rules: {
            Nombre: "required",
            Descripcion: "required"
           

        },
        messages: {
            Nombre: "(*)",
            Descripcion: "(*)"
           

        },
        errorElement: 'span'
    });


    tablatienda = $('#tbTienda').DataTable({
        "ajax": {
            "url": $.MisUrls.url._ObtenerA ,
            "type": "GET",
            "datatype": "json"
        },
        "columns": [
            {
                "data": "IdAgencia", "render": function (data, type, row, meta) {
                    return "<button class='btn btn-sm btn-primary ml-2' type='button' onclick='tiendaSelect(" + JSON.stringify(row) + ")'><i class='fas fa-check'></i></button>" 
                },
                "orderable": false,
                "searchable": false,
                "width": "90px"
            },
            
            { "data": "Nombre" },
            { "data": "Direccion" },
         

        ],
        "language": {
            "url": $.MisUrls.url.Url_datatable_spanish
        },
        responsive: true
    });

    tablaproducto = $('#tbProducto').DataTable({
        "ajax": {
            "url": $.MisUrls.url._ObtenerE,
            "type": "GET",
            "datatype": "json"
        },
        "columns": [
            {
                "data": "IdProducto", "render": function (data, type, row, meta) {
                    return "<button class='btn btn-sm btn-primary ml-2' type='button' onclick='productoSelect(" + JSON.stringify(row) + ")'><i class='fas fa-check'></i></button>"
                },
                "orderable": false,
                "searchable": false,
                "width": "90px"
            },
            { "data": "Codigo" },
            { "data": "Nombre" },
            { "data": "Descripcion" },
            { "data": "CodigoValle" },
            { "data": "Serie" },
            { "data": "EstadoEquipo" },
           
            {
                "data": "oCategoria", render: function (data) {
                    return data.Descripcion
                }
            }

        ],
        "language": {
            "url": $.MisUrls.url.Url_datatable_spanish
        },
        responsive: true
    });


    tabladata = $('#tbdata').DataTable({
        "ajax": {
            "url": $.MisUrls.url._ObtenerAsignaciones,
            "type": "GET",
            "datatype": "json"
        },
        "columns": [
            { "data": "oAgencia", render: function (data) { return data.Nombre } },
            { "data": "oAgencia", render: function (data) { return data.Direccion } },
            { "data": "oProducto", render: function (data) { return data.Codigo   } },
            { "data": "oProducto", render: function (data) { return data.Nombre   } },
            { "data": "Stock" },
            {
                "data": "IdProductoAgencia", "render": function (data, type, row, meta) {
                    return  "<button class='btn btn-danger btn-sm ml-2' type='button' onclick='eliminar(" + data + ")'><i class='fa fa-trash'></i></button>"
                },
                "orderable": false,
                "searchable": false,
                "width": "80px"
            }

        ],
        "language": {
            "url": $.MisUrls.url.Url_datatable_spanish
        },
        responsive: true
    });

})


function buscarAgencia() {
    tablatienda.ajax.reload();
    $('#modalTienda').modal('show');
}

function buscarProducto(){
    tablaproducto.ajax.reload();
    $('#modalProducto').modal('show');
}

function tiendaSelect(json) {
    $("#txtIdAgencia").val(json.IdAgencia);
    
    $("#txtRazonSocial").val(json.Nombre);
    $("#txtDireccion").val(json.Direccion);

    $('#modalTienda').modal('hide');
}

function productoSelect(json) {
    $("#txtIdProducto").val(json.IdProducto);
    $("#txtCodigo").val(json.Codigo);
    $("#txtNombre").val(json.Nombre);
    $("#txtDescripcion").val(json.Descripcion);
    $("#txtCodigoValle").val(json.CodigoValle);
    $("#txtSerie").val(json.Serie);
    $("#txtEstadoEquipo").val(json.EstadoEquipo);

    $('#modalProducto').modal('hide');
}

$("#txtCodigo").on('keypress', function (e) {

    if (e.which == 13) {
        
        //OBTENER PRODUCTOS
        jQuery.ajax({
            url: $.MisUrls.url._ObtenerProductos,
            type: "GET",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                $("#txtCodigo").LoadingOverlay("hide");
                var encontrado = false;
                if (data.data != null) {
                    $.each(data.data, function (i, item) {
                        if (item.Activo == true && item.Codigo == $("#txtCodigo").val()) {

                            $("#txtIdProducto").val(item.IdProducto);
                            $("#txtCodigo").val(item.Codigo);
                            $("#txtNombre").val(item.Nombre);
                            $("#txtDescripcion").val(item.Descripcion);
                            $("#txtCodigoValle").val(item.CodigoValle);
                            $("#txtSerie").val(item.Serie);
                            $("#txtEstadoEquipo").val(item.EstadoEquipo);

                            encontrado = true;
                            return false;
                        }
                    })

                    if (!encontrado) {
                        $("#txtIdProducto").val("0");
                        $("#txtNombre").val("");
                        $("#txtDescripcion").val("");
                        $("#txtCodigoValle").val("");
                        $("#txtSerie").val("");
                        $("#txtEstadoEquipo").val("");
                    }
                }

            },
            error: function (error) {
                console.log(error)
            },
            beforeSend: function () {
                $("#txtCodigo").LoadingOverlay("show");
            },
        });


    }
});


function asignarProducto() {

    var camposvacios = false;

    if ($("#txtIdAgencia").val() == "0" || $("#txtIdProducto").val() == "0")
        camposvacios = true;

    if (!camposvacios) {

        var request = {
            objeto: {
                oProducto: { IdProducto: parseInt($("#txtIdProducto").val()) },
                oAgencia: { IdAgencia: parseInt($("#txtIdAgencia").val()) },
            }
        }

        jQuery.ajax({
            url: $.MisUrls.url._RegistrarProductoAgencia,
            type: "POST",
            data: JSON.stringify(request),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {

                if (data.resultado) {
                    tabladata.ajax.reload();
                    $("#txtIdProducto").val("0");
                    $("#txtCodigo").val("");
                    $("#txtNombre").val("");
                    $("#txtDescripcion").val("");
                    
                  
                } else {

                    swal("Mensaje", "El equipo ya esta asignado", "warning")
                }
            },
            error: function (error) {
                console.log(error)
            },
            beforeSend: function () {

            },
        });

    } else {
        swal("Mensaje!", "Complete todos los campos", "warning")
    }


}


function eliminar($id) {

    swal({
        title: "Mensaje",
        text: "¿Desea eliminar la asignación?",
        type: "warning",
        showCancelButton: true,

        confirmButtonText: "Si",
        confirmButtonColor: "#DD6B55",

        cancelButtonText: "No",

        closeOnConfirm: true
    },

        function () {
            jQuery.ajax({
                url: $.MisUrls.url._EliminarProductoAgencia + "?id=" + $id,
                type: "GET",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {

                    if (data.resultado) {
                        tabladata.ajax.reload();
                    } else {
                        alert('No se pudo eliminar la asignación, ya se encuentra asignado!');
                        swal("Mensaje", "No se pudo eliminar la asignación?", "warning");
                    }
                },
                error: function (error) {
                    console.log(error)
                },
                beforeSend: function () {

                },
            });
        });

}