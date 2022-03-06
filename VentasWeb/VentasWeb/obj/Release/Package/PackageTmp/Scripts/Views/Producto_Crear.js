
var tabladata;
$(document).ready(function () {
    activarMenu("Herramientas");


    ////validamos el formulario
    $("#form").validate({
        rules: {
            Nombre: "required",
            Descripcion: "required",
            CodigoValle: "required",
            Serie: "required",
            EstadoEquipo: "required"
        },
        messages: {
            Nombre: "(*)",
            Descripcion: "(*)",
            CodigoValle: "(*)",
            Serie: "(*)",
            EstadoEquipo: "(*)"

        },
        errorElement: 'span'
    });

    //OBTENER CATEGORIAS
    jQuery.ajax({
        url: $.MisUrls.url._ObtenerCategorias,
        type: "GET",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            
            $("#cboCategoria").html("");

            if (data.data != null) {
                $.each(data.data, function (i, item) {

                    if (item.Activo == true) {
                        $("<option>").attr({ "value": item.IdCategoria }).text(item.Descripcion).appendTo("#cboCategoria");
                    }
                })
                $("#cboCategoria").val($("#cboCategoria option:first").val());
            }

        },
        error: function (error) {
            console.log(error)
        },
        beforeSend: function () {
        },
    });


    tabladata = $('#tbdata').DataTable({
        "ajax": {
            "url": $.MisUrls.url._ObtenerProductos,
            "type": "GET",
            "datatype": "json"
        },
        "columns": [
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
            },
            {
                "data": "Activo", "render": function (data) {
                    if (data) {
                        return '<span class="badge badge-success">Activo</span>'
                    } else {
                        return '<span class="badge badge-danger">No Activo</span>'
                    }
                }
            },
            {
                "data": "IdProducto", "render": function (data, type, row, meta) {
                    return "<button class='btn btn-primary btn-sm' type='button' onclick='abrirPopUpForm(" + JSON.stringify(row) + ")'><i class='fas fa-pen'></i></button>"// +
                      //  "<button class='btn btn-danger btn-sm ml-2' type='button' onclick='eliminar(" + data + ")'><i class='fa fa-trash'></i></button>"
                },
                "orderable": false,
                "searchable": false,
                "width": "90px"
            }

        ],
        "language": {
            "url": $.MisUrls.url.Url_datatable_spanish
        },
        responsive: true
    });


})


function abrirPopUpForm(json) {

    $("#txtid").val(0);

    if (json != null) {

        $("#txtid").val(json.IdProducto);
        
        $("#txtCodigo").val(json.Codigo);
        $("#txtNombre").val(json.Nombre);
        $("#txtDescripcion").val(json.Descripcion);
        $("#txtCodigoValle").val(json.CodigoValle);
        $("#txtSerie").val(json.Serie);
        $("#txtEstadoEquipo").val(json.EstadoEquipo);
        $("#cboCategoria").val(json.IdCategoria);
        $("#cboEstado").val(json.Activo == true ? 1 : 0);
        $("#txtCodigo").prop("disabled", true)

    } else {

        $("#txtCodigo").val("AUTOGENERADO");
        $("#txtCodigo").prop("disabled", true)
        $("#txtNombre").val("");
        $("#txtDescripcion").val("");
        $("#txtCodigoValle").val("");
        $("#txtSerie").val("");
        $("#txtEstadoEquipo").val("");
        $("#cboCategoria").val($("#cboCategoria option:first").val());

        $("#cboEstado").val(1);
        
    }

    $('#FormModal').modal('show');

}


function Guardar() {

    if ($("#form").valid()) {

        var request = {
            objeto: {
                IdProducto: parseInt($("#txtid").val()),
                Nombre: $("#txtNombre").val(),
                Descripcion: $("#txtDescripcion").val(),
                CodigoValle: $("#txtCodigoValle").val(),
                Serie: $("#txtSerie").val(),
                EstadoEquipo: $("#txtEstadoEquipo").val(),
                IdCategoria: $("#cboCategoria").val(),
                Activo: ($("#cboEstado").val() == "1" ? true : false)
            }
        }

        jQuery.ajax({
            url: $.MisUrls.url._GuardarProducto,
            type: "POST",
            data: JSON.stringify(request),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {

                if (data.resultado) {
                    tabladata.ajax.reload();
                    $('#FormModal').modal('hide');
                    swal("Mensaje", "Se registro el equipo con exito!", "success")
                } else {

                    swal("Mensaje", "No se pudo guardar los cambios", "warning")
                }
            },
            error: function (error) {
                console.log(error)
            },
            beforeSend: function () {

            },
        });

    }

}


function eliminar($id) {


    swal({
        title: "Mensaje",
        text: "¿Desea eliminar el producto seleccionado?",
        type: "warning",
        showCancelButton: true,

        confirmButtonText: "Si",
        confirmButtonColor: "#DD6B55",

        cancelButtonText: "No",

        closeOnConfirm: true
    },

        function () {
            jQuery.ajax({
                url: $.MisUrls.url._EliminarProducto + "?id=" + $id,
                type: "GET",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {

                    if (data.resultado) {
                        tabladata.ajax.reload();
                        alert('Equipo eliminado!');
                    } else {
                         
                        alert('El Equipo no se puede eliminado!');

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