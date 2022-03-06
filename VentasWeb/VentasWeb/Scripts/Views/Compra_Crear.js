﻿var tabladata;
var tablaproveedor;
var tablatienda;
var tablaproducto;



$(document).ready(function () {
    activarMenu("Compras");
    ////validamos el formulario
    $("#form").validate({
        rules: {

            NumeroFactura: "required",
            Cantidad: "required",
            PrecioCompra: "required"
        },
        messages: {

            NumeroFactura: "Debes completar los campos",
            Cantidad: "Debes completar los campos",
            PrecioCompra: "Debes completar los campos"

        },
        errorElement: 'span'
    });
    //OBTENER PROVEEDORES
    tablaproveedor = $('#tbProveedor').DataTable({
        "ajax": {
            "url": $.MisUrls.url._ObtenerP,
            "type": "GET",
            "datatype": "json"
        },
        "columns": [
            {
                "data": "IdProveedor", "render": function (data, type, row, meta) {
                    return "<button class='btn btn-sm btn-primary ml-2' type='button' onclick='proveedorSelect(" + JSON.stringify(row) + ")'><i class='fas fa-check'></i></button>"
                },
                "orderable": false,
                "searchable": false,
                "width": "90px"
            },
            { "data": "Ruc" },
            { "data": "RazonSocial" },
            { "data": "Direccion" }

        ],
        "language": {
            "url": $.MisUrls.url.Url_datatable_spanish
        },
        responsive: true
    });

    //OBTENER AGENCIAS
    tablatienda = $('#tbTienda').DataTable({
        "ajax": {
            "url": $.MisUrls.url._ObtenerA,
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
            { "data": "Telefono" }

        ],
        "language": {
            "url": $.MisUrls.url.Url_datatable_spanish
        },
        responsive: true
    });

    //OBTENER PRODUCTOS
    tablaproducto = $('#tbProducto').DataTable({
        "ajax": {
            "url": $.MisUrls.url._ObtenerProductosPorAgencia + "?IdAgencia=0",
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

})

function buscarProveedor() {
    tablaproveedor.ajax.reload();
    $('#modalProveedor').modal('show');
}


function buscarAgencia() {
    tablatienda.ajax.reload();
    $('#modalTienda').modal('show');
}

function buscarProducto() {
    if (parseInt($("#txtIdAgencia").val()) == 0) {
        swal("Mensaje", "Debe seleccionar una agencia primero", "warning")
        return;
    }
    tablaproducto.ajax.url($.MisUrls.url._ObtenerProductosPorAgencia + "?IdAgencia=" + $("#txtIdAgencia").val()).load();

    $('#modalProducto').modal('show');
}

function proveedorSelect(json) {

    $("#txtIdProveedor").val(json.IdProveedor);
    $("#txtRucProveedor").val(json.Ruc);
    $("#txtRazonSocialProveedor").val(json.RazonSocial);

    $('#modalProveedor').modal('hide');
}

function tiendaSelect(json) {
    $("#txtIdAgencia").val(json.IdAgencia);

    $("#txtNombreAgencia").val(json.Nombre);
    $("#txtTelefono").val(json.Telefono);
    $('#modalTienda').modal('hide');
}

function productoSelect(json) {
    $("#txtIdProducto").val(json.IdProducto);
    $("#txtCodigoProducto").val(json.Codigo);
    $("#txtNombreProducto").val(json.Nombre);

    $('#modalProducto').modal('hide');
}



$("#txtCodigoProducto").on('keypress', function (e) {

    if (e.which == 13) {

        //OBTENER PRODUCTOS
        jQuery.ajax({
            url: $.MisUrls.url._ObtenerProductos,
            type: "GET",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                $("#txtCodigoProducto").LoadingOverlay("hide");
                var encontrado = false;
                if (data.data != null) {
                    $.each(data.data, function (i, item) {
                        if (item.Activo == true && item.Codigo == $("#txtCodigoProducto").val()) {

                            $("#txtIdProducto").val(item.IdProducto);
                            $("#txtCodigoProducto").val(item.Codigo);
                            $("#txtNombreProducto").val(item.Nombre);

                            encontrado = true;
                            return false;
                        }
                    })

                    if (!encontrado) {
                        $("#txtIdProducto").val("0");
                        $("#txtNombreProducto").val("");
                    }
                }
            },
            error: function (error) {
                console.log(error)
            },
            beforeSend: function () {
                $("#txtCodigoProducto").LoadingOverlay("show");
            },
        });


    }
});

$.fn.inputFilter = function (inputFilter) {
    return this.on("input keydown keyup mousedown mouseup select contextmenu drop", function () {
        if (inputFilter(this.value)) {
            this.oldValue = this.value;
            this.oldSelectionStart = this.selectionStart;
            this.oldSelectionEnd = this.selectionEnd;
        } else if (this.hasOwnProperty("oldValue")) {
            this.value = this.oldValue;
            this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
        } else {
            this.value = "";
        }
    });
};

$("#txtFactura").inputFilter(function (value) {
    return /^-?\d*$/.test(value);
});

$("#txtCantidadProducto").inputFilter(function (value) {
    return /^-?\d*$/.test(value);
});

$("#txtPrecioCompraProducto").inputFilter(function (value) {
    return /^-?\d*[.]?\d{0,2}$/.test(value);
});

//$("#txtPrecioVentaProducto").inputFilter(function (value) {
//  return /^-?\d*[.]?\d{0,2}$/.test(value);
//});



$('#btnAgregarCompra').on('click', function () {

    var existe_codigo = false;
    if (
        parseInt($("#txtIdProveedor").val()) == 0 ||
        parseInt($("#txtIdAgencia").val()) == 0 ||
        parseInt($("#txtIdProducto").val()) == 0 ||
        parseFloat($("#txtCantidadProducto").val()) == 0 ||
        parseFloat($("#txtPrecioCompraProducto").val()) == 0 ||

        parseFloat($("#txtFactura").val()) == 0
    ) {
        swal("Mensaje", "Debe completar todos los campos", "warning")
        return;
    }

    $('#tbCompra > tbody  > tr').each(function (index, tr) {
        var fila = tr;
        var codigoproducto = $(fila).find("td.codigoproducto").text();

        if (codigoproducto == $("#txtCodigoProducto").val()) {
            existe_codigo = true;
            return false;
        }

    });

    if (!existe_codigo) {
        $("<tr>").append(
            $("<td>").append(
                $("<button>").addClass("btn btn-danger btn-sm").text("Eliminar")
            ),
            $("<td>").append($("#txtRucProveedor").val()),

            $("<td>").addClass("codigoproducto").data("idproducto", $("#txtIdProducto").val()).append($("#txtCodigoProducto").val()),
            $("<td>").append($("#txtNombreProducto").val()),
            $("<td>").addClass("cantidad").append($("#txtCantidadProducto").val()),
            $("<td>").addClass("preciocompra").append($("#txtPrecioCompraProducto").val()),
            //  $("<td>").addClass("precioventa").append($("#txtPrecioVentaProducto").val()),
            $("<td>").addClass("numerofactura").append($("#txtFactura").val()),
        ).appendTo("#tbCompra tbody");

        $("#txtIdProducto").val("0");
        $("#txtCodigoProducto").val("");
        $("#txtNombreProducto").val("");
        $("#txtCantidadProducto").val("0");
        $("#txtPrecioCompraProducto").val("0");
        //  $("#txtPrecioVentaProducto").val("");


    } else {
        swal("Mensaje", "El producto ya existe en la compra", "warning")
    }
})

$('#tbCompra tbody').on('click', 'button[class="btn btn-danger btn-sm"]', function () {
    $(this).parents("tr").remove();
})



$('#btnTerminarGuardarCompra').on('click', function () {


    if ($('#tbCompra > tbody  > tr').length == 0) {
        swal("Mensaje", "No existen detalles", "warning")
        return;
    }

    var $xml = "";
    var compra = "";
    var detallecompra = ""
    var detalle = "";
    var totalcostocompra = 0;

    $xml = "<DETALLE>";
    compra = "<COMPRA>" +
        "<IdUsuario>!idusuario¡</IdUsuario>" +
        "<IdProveedor>" + $("#txtIdProveedor").val() + "</IdProveedor>" +
        "<IdAgencia>" + $("#txtIdAgencia").val() + "</IdAgencia>" +
        "<TotalCosto>!totalcosto¡</TotalCosto>" +
        "<NumeroFactura>" + $("#txtFactura").val() + "</NumeroFactura>" +
        "</COMPRA>";
    detallecompra = "<DETALLE_COMPRA>"

    $('#tbCompra > tbody  > tr').each(function (index, tr) {

        var fila = tr;
        var idproducto = parseFloat($(fila).find("td.codigoproducto").data("idproducto"));
        var cantidad = parseFloat($(fila).find("td.cantidad").text());
        var preciocompra = parseFloat($(fila).find("td.preciocompra").text());
        // var precioventa = parseFloat($(fila).find("td.precioventa").text());
        var totalcosto = parseFloat(cantidad) * parseFloat(preciocompra);
        var numerofactura = ($(fila).find("td.numerofactura").text());

        detalle = detalle + "<DETALLE>" +
            "<IdCompra>0</IdCompra>" +
            "<IdProducto>" + idproducto + "</IdProducto>" +
            "<Cantidad>" + cantidad + "</Cantidad>" +
            "<PrecioUnidadCompra>" + preciocompra + "</PrecioUnidadCompra>" +
            // "<PrecioUnidadVenta>" + precioventa + "</PrecioUnidadVenta>" +
            "<TotalCosto>" + totalcosto.toString() + "</TotalCosto>" +
            "<NumeroFactura>" + numerofactura + "</NumeroFactura>" +
            "</DETALLE>";
        totalcostocompra = totalcostocompra + totalcosto;

    });

    compra = compra.replace("!totalcosto¡", totalcostocompra.toString());
    $xml = $xml + compra + detallecompra + detalle + "</DETALLE_COMPRA></DETALLE>";

    var request = { xml: $xml };



    jQuery.ajax({
        url: $.MisUrls.url._GuardarCompra,
        type: "POST",
        data: JSON.stringify(request),
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            $.LoadingOverlay("hide");

            if (data.resultado) {

                //PROVEEDOR
                $("#txtIdProveedor").val("0");
                $("#txtRucProveedor").val("");
                $("#txtRazonSocialProveedor").val("");

                //TIENDA
                $("#txtIdAgencia").val("0");

                $("#txtNombreAgencia").val("");
                $("#txtTelefono").val("")

                //PRODUCTO
                $("#txtIdProducto").val("0");
                $("#txtCodigoProducto").val("");
                $("#txtNombreProducto").val("");
                $("#txtCantidadProducto").val("0");
                $("#txtPrecioCompraProducto").val("0");
                // $("#txtPrecioVentaProducto").val("0");
                $("#txtFactura").val("0");

                $("#tbCompra tbody").html("");

                swal("Mensaje", "Se registro la compra", "success")
            } else {

                swal("Mensaje", "No se pudo registrar la compra", "warning")
            }
        },
        error: function (error) {
            console.log(error)
        },
        beforeSend: function () {
            $.LoadingOverlay("show");
        },
    });



})
