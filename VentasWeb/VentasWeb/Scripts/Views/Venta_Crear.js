var tablaproducto;
var tablacliente;
var tablatienda;
var tabladata;
$(document).ready(function () {

    activarMenu("Ventas");
    $("#txtproductocantidad").val("0");
    $("#txtfechaventa").val(ObtenerFecha());


    //OBTENER PROVEEDORES
    jQuery.ajax({
        url: $.MisUrls.url._ObtenerUsuario,
        type: "GET",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            //AGENCIA
            $("#txtIdAgencia").val(data.oAgencia.IdAgencia);
            $("#lbltiendanombre").text(data.oAgencia.Nombre);
            // $("#lbltiendaruc").text(data.oTienda.RUC);
            $("#lbltiendadireccion").text(data.oAgencia.Direccion);

            //USUARIO
            $("#txtIdUsuario").val(data.IdUsuario);
            $("#lblempleadonombre").text(data.Nombres);
            $("#lblempleadoapellido").text(data.Apellidos);
            $("#lblempleadocorreo").text(data.Correo);
        },
        error: function (error) {
            console.log(error)
        },
        beforeSend: function () {
            $("#cboProveedor").LoadingOverlay("show");
        },
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
            // { "data": "RUC" },
            { "data": "Nombre" },
            { "data": "Direccion" }

        ],
        "language": {
            "url": $.MisUrls.url.Url_datatable_spanish
        },
        responsive: true
    });

    //OBTENER EQUIPOS
    tablaproducto = $('#tbProducto').DataTable({
        "ajax": {
            "url": $.MisUrls.url._ObtenerProductoStockPorAgencia + "?IdAgencia=0",
            "type": "GET",
            "datatype": "json"
        },
        "columns": [
            {
                "data": "IdProductoAgencia", "render": function (data, type, row, meta) {
                    return "<button class='btn btn-sm btn-primary ml-2' type='button' onclick='productoSelect(" + JSON.stringify(row) + ")'><i class='fas fa-check'></i></button>"
                },
                "orderable": false,
                "searchable": false,
                "width": "90px"
            },
            {
                "data": "oProducto", render: function (data) {
                    return data.Codigo
                }
            },
            {
                "data": "oProducto", render: function (data) {
                    return data.Nombre
                }
            },
            {
                "data": "oProducto", render: function (data) {
                    return data.Descripcion
                }
            },
            { "data": "Stock" }

        ],
        "language": {
            "url": $.MisUrls.url.Url_datatable_spanish
        },
        responsive: true
    });

    tablacliente = $('#tbcliente').DataTable({
        "ajax": {
            "url": $.MisUrls.url._ObtenerC,
            "type": "GET",
            "datatype": "json"
        },
        "columns": [
            {
                "data": "IdCliente", "render": function (data, type, row, meta) {
                    return "<button class='btn btn-sm btn-primary ml-2' type='button' onclick='clienteSelect(" + JSON.stringify(row) + ")'><i class='fas fa-check'></i></button>"
                },
                "orderable": false,
                "searchable": false,
                "width": "90px"
            },
            { "data": "TipoDocumento" },
            { "data": "NumeroDocumento" },
            { "data": "Nombre" },
            { "data": "Direccion" }
        ],
        "language": {
            "url": $.MisUrls.url.Url_datatable_spanish
        },
        responsive: true
    });

})

function ObtenerFecha() {

    var d = new Date();
    var month = d.getMonth() + 1;
    var day = d.getDate();
    var output = (('' + day).length < 2 ? '0' : '') + day + '/' + (('' + month).length < 2 ? '0' : '') + month + '/' + d.getFullYear();

    return output;
}


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

$("#txtproductocantidad").inputFilter(function (value) {
    return /^-?\d*$/.test(value);
});

$("#txtmontopago").inputFilter(function (value) {
    return /^-?\d*[.]?\d{0,2}$/.test(value);
});

$('#btnBuscarProducto').on('click', function () {


    tablaproducto.ajax.url($.MisUrls.url._ObtenerProductoStockPorAgencia + "?IdAgencia=" + parseInt($("#txtIdAgencia").val())).load();

    $('#modalProducto').modal('show');
})

$('#btnBuscarCliente').on('click', function () {

    tablacliente.ajax.reload();

    $('#modalCliente').modal('show');
})

function productoSelect(json) {
    $("#txtIdProducto").val(json.oProducto.IdProducto);
    $("#txtproductocodigo").val(json.oProducto.Codigo);
    $("#txtproductonombre").val(json.oProducto.Nombre);
    $("#txtproductodescripcion").val(json.oProducto.Descripcion);
    $("#txtproductostock").val(json.Stock);
    //  $("#txtproductoprecio").val(json.PrecioUnidadVenta);
    $("#txtproductocantidad").val("0");
    $('#modalProducto').modal('hide');
}

function clienteSelect(json) {

    $("#cboclientetipodocumento").val(json.TipoDocumento);
    $("#txtclientedocumento").val(json.NumeroDocumento);
    $("#txtclientenombres").val(json.Nombre);
    $("#txtclientedireccion").val(json.Direccion);
    $("#txtclientetelefono").val(json.Telefono);
    // $("#txtclienteagencia").val(json.TipoDocumento);
    $('#modalCliente').modal('hide');
}

function buscarAgencia() {
    tablatienda.ajax.reload();
    $('#modalTienda').modal('show');
}

function tiendaSelect(json) {
    $("#txtIdAgencia").val(json.IdAgencia);
    $("#txtRucTienda").val(json.Telefono);
    $("#txtNombreAgencia").val(json.Nombre);

    $('#modalTienda').modal('hide');
}


$("#txtproductocodigo").on('keypress', function (e) {


    if (e.which == 13) {

        var request = { IdAgencia: parseInt($("#txtIdAgencia").val()) }


        //OBTENER PROVEEDORES
        jQuery.ajax({
            url: $.MisUrls.url._ObtenerProductoStockPorAgencia + "?IdAgencia=" + parseInt($("#txtIdAgencia").val()),
            type: "GET",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {

                var encontrado = false;
                if (data.data != null) {
                    $.each(data.data, function (i, item) {
                        if (item.oProducto.Codigo == $("#txtproductocodigo").val()) {

                            $("#txtIdProducto").val(item.oProducto.IdProducto);
                            $("#txtproductocodigo").val(item.oProducto.Codigo);
                            $("#txtproductonombre").val(item.oProducto.Nombre);
                            $("#txtproductodescripcion").val(item.oProducto.Descripcion);
                            $("#txtproductostock").val(item.Stock);
                            //  $("#txtproductoprecio").val(item.PrecioUnidadVenta);
                            encontrado = true;
                            return false;
                        }
                    })

                    if (!encontrado) {

                        $("#txtIdProducto").val("0");
                        $("#txtproductocodigo").val("");
                        $("#txtproductonombre").val("");
                        $("#txtproductodescripcion").val("");
                        $("#txtproductostock").val("");
                        //   $("#txtproductoprecio").val("");
                        $("#txtproductocantidad").val("0");

                    }
                }

            },
            error: function (error) {
                console.log(error)
            },
            beforeSend: function () {
                $("#cboProveedor").LoadingOverlay("show");
            },
        });



    }
});


$('#btnAgregar').on('click', function () {

    $("#txtproductocantidad").val($("#txtproductocantidad").val() == "" ? "0" : $("#txtproductocantidad").val());

    var existe_codigo = false;
    if (
        parseInt($("#txtIdProducto").val()) == 0 ||
        parseFloat($("#txtproductocantidad").val()) == 0

    ) {
        swal("Mensaje", "Debe completar todos los campos del equipo", "warning")
        return;
    } else if (
        parseFloat($("#txtproductocantidad").val()) >
        parseFloat($("#txtproductostock").val())
    ) {
        swal("Mensaje", "No existe esa cantidad de equipos", "warning")
        return;

    }

    $('#tbVenta > tbody  > tr').each(function (index, tr) {
        var fila = tr;
        var idproducto = $(fila).find("td.producto").data("idproducto");

        if (idproducto == $("#txtIdProducto").val()) {
            existe_codigo = true;
            return false;
        }

    });

    if (!existe_codigo) {

        controlarStock(parseInt($("#txtIdProducto").val()), parseInt($("#txtIdAgencia").val()), parseInt($("#txtproductocantidad").val()), true);

        //  var importetotal = parseFloat($("#txtproductoprecio").val()) * parseFloat($("#txtproductocantidad").val());
        $("<tr>").append(
            $("<td>").append(
                $("<button>").addClass("btn btn-danger btn-sm").text("Eliminar").data("idproducto", parseInt($("#txtIdProducto").val())).data("cantidadproducto", parseInt($("#txtproductocantidad").val()))
            ),
            $("<td>").addClass("productocantidad").text($("#txtproductocantidad").val()),
            $("<td>").addClass("producto").data("idproducto", $("#txtIdProducto").val()).text($("#txtproductonombre").val()),
            $("<td>").text($("#txtproductodescripcion").val()),
            //   $("<td>").addClass("productoprecio").text($("#txtproductoprecio").val()),
            $("<td>").addClass("observacion").text($("#w3review").val()),
            //    $("<td>").addClass("importetotal").text(importetotal)
        ).appendTo("#tbVenta tbody");

        $("#txtIdProducto").val("0");
        $("#txtproductocodigo").val("");
        $("#txtproductonombre").val("");
        $("#txtproductodescripcion").val("");
        $("#txtproductostock").val("");
        //  $("#txtproductoprecio").val("");
        $("#txtproductocantidad").val("0");
        $("#w3review").val("");
        $("#txtproductocodigo").focus();

        //calcularPrecios();
    } else {
        swal("Mensaje", "El equipo ya existe en la asignacion", "warning")
    }
})

$('#tbVenta tbody').on('click', 'button[class="btn btn-danger btn-sm"]', function () {
    var idproducto = $(this).data("idproducto");
    var cantidadproducto = $(this).data("cantidadproducto");

    controlarStock(idproducto, parseInt($("#txtIdAgencia").val()), cantidadproducto, false);
    $(this).parents("tr").remove();

    //calcularPrecios();
})

$('#btnTerminarGuardarVenta').on('click', function () {

    //VALIDACIONES DE CLIENTE
    if ($("#txtclientetelefono").val().trim() == "" || $("#txtclientenombres").val().trim() == "") {
        swal("Mensaje", "Complete los datos del personal", "warning");
        return;
    }
    //VALIDACIONES DE PRODUCTOS
    if ($('#tbVenta tbody tr').length == 0) {
        swal("Mensaje", "Debe registrar minimo un equipo en la asignacion", "warning");
        return;
    }

    //VALIDACIONES DE MONTO PAGO
    // if ($("#txtmontopago").val().trim() == "") {
    //     swal("Mensaje", "Ingrese el monto de pago", "warning");
    //    return;
    // }

    var $totalproductos = 0;
    var $totalimportes = 0;

    var DETALLE = "";
    var VENTA = "";
    var DETALLE_CLIENTE = "";
    var DETALLE_VENTA = "";
    var DATOS_VENTA = "";

    //calcularCambio();

    $('#tbVenta > tbody  > tr').each(function (index, tr) {
        var fila = tr;
        var productocantidad = parseInt($(fila).find("td.productocantidad").text());
        var idproducto = $(fila).find("td.producto").data("idproducto");
        // var productoprecio = parseFloat($(fila).find("td.productoprecio").text());
        var observacion = $(fila).find("td.observacion").text();
        //  var importetotal = parseFloat($(fila).find("td.importetotal").text());

        $totalproductos = $totalproductos + productocantidad;
        //  $totalimportes = $totalimportes + importetotal;

        DATOS_VENTA = DATOS_VENTA + "<DATOS>" +
            "<IdVenta>0</IdVenta >" +
            "<IdProducto>" + idproducto + "</IdProducto>" +
            "<Cantidad>" + productocantidad + "</Cantidad>" +
            // "<PrecioUnidad>" + productoprecio + "</PrecioUnidad>" +
            "<Observacion>" + observacion + "</Observacion>" +
            //    "<ImporteTotal>" + importetotal + "</ImporteTotal>" +
            "</DATOS>"
    });


    VENTA = "<VENTA>" +
        "<IdAgencia>" + $("#txtIdAgencia").val() + "</IdAgencia>" +
        "<IdUsuario>" + $("#txtIdUsuario").val() + "</IdUsuario>" +
        "<IdCliente>0</IdCliente>" +
        "<TipoDocumento>" + $("#cboventatipodocumento").val() + "</TipoDocumento>" +
        "<CantidadProducto>" + $('#tbVenta tbody tr').length + "</CantidadProducto>" +
        "<CantidadTotal>" + $totalproductos + "</CantidadTotal>" +

        // "<TotalCosto>" + $totalimportes + "</TotalCosto>" +
        // "<ImporteRecibido>" + $("#txtmontopago").val() + "</ImporteRecibido>" +
        // "<ImporteCambio>" + $("#txtcambio").val() + "</ImporteCambio>" +
        "</VENTA >";

    DETALLE_CLIENTE = "<DETALLE_CLIENTE><DATOS>" +
        "<TipoDocumento>" + $("#cboclientetipodocumento").val() + "</TipoDocumento>" +
        "<NumeroDocumento>" + $("#txtclientedocumento").val() + "</NumeroDocumento>" +
        "<Nombre>" + $("#txtclientenombres").val() + "</Nombre>" +
        "<Direccion>" + $("#txtclientedireccion").val() + "</Direccion>" +
        "<Telefono>" + $("#txtclientetelefono").val() + "</Telefono>" +
        "</DATOS></DETALLE_CLIENTE>";

    DETALLE_VENTA = "<DETALLE_VENTA>" + DATOS_VENTA + "</DETALLE_VENTA>";

    DETALLE = "<DETALLE>" + VENTA + DETALLE_CLIENTE + DETALLE_VENTA + "</DETALLE>"


    var request = { xml: DETALLE };

    jQuery.ajax({
        url: $.MisUrls.url._RegistrarVenta,
        type: "POST",
        data: JSON.stringify(request),
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {

            $(".card-venta").LoadingOverlay("hide");

            if (data.estado) {
                //DOCUMENTO
                $("#cboventatipodocumento").val("Nota de entrega");

                //CLIENTE
                $("#cboclientetipodocumento").val("");
                $("#txtclientedocumento").val("");
                $("#txtclientenombres").val("");
                $("#txtclientedireccion").val("");
                $("#txtclientetelefono").val("");


                //PRODUCTO
                $("#txtIdProducto").val("0");
                $("#txtproductocodigo").val("");
                $("#txtproductonombre").val("");
                $("#txtproductodescripcion").val("");
                $("#txtproductostock").val("");
                //   $("#txtproductoprecio").val("");
                $("#txtproductocantidad").val("0");

                //PRECIOS
                //  $("#txtsubtotal").val("0");
                // $("#txtigv").val("0");
                // $("#txttotal").val("0");
                //  $("#txtmontopago").val("");
                //  $("#txtcambio").val("");

                swal("Mensaje", "Registro guardado", "success")
                $("#tbVenta tbody").html("");


                //  var url = $.MisUrls.url._DocumentoVenta + "?IdVenta=" + data.valor;
                //   window.open(url);


            } else {
                swal("Mensaje", "No se pudo registrar la entrega de equipos", "warning")
            }
        },
        error: function (error) {
            console.log(error)
            $(".card-venta").LoadingOverlay("hide");
        },
        beforeSend: function () {
            $(".card-venta").LoadingOverlay("show");
        }
    });



})

function calcularCambio() {
    var montopago = $("#txtmontopago").val().trim() == "" ? 0 : parseFloat($("#txtmontopago").val().trim());
    var totalcosto = parseFloat($("#txttotal").val().trim());
    var cambio = 0;
    cambio = (montopago <= totalcosto ? totalcosto : montopago) - totalcosto;

    $("#txtcambio").val(cambio.toFixed(2));
}

$('#btncalcular').on('click', function () {
    // calcularCambio();
})


function calcularPrecios() {
    var subtotal = 0;
    var igv = 0;
    var sumatotal = 0;
    $('#tbVenta > tbody  > tr').each(function (index, tr) {
        var fila = tr;
        var importetotal = parseFloat($(fila).find("td.importetotal").text());
        sumatotal = sumatotal + importetotal;
    });
    igv = sumatotal * 0.18;
    subtotal = sumatotal - igv;


    $("#txtsubtotal").val(subtotal.toFixed(2));
    $("#txtigv").val(igv.toFixed(2));
    $("#txttotal").val(sumatotal.toFixed(2));
}




function controlarStock($idproducto, $idagencia, $cantidad, $restar) {
    var request = {
        idproducto: $idproducto,
        idagencia: $idagencia,
        cantidad: $cantidad,
        restar: $restar
    }


    jQuery.ajax({
        url: $.MisUrls.url._ControlarStockProducto,
        type: "POST",
        data: JSON.stringify(request),
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {

        },
        error: function (error) {
            console.log(error)
        },
        beforeSend: function () {
        },
    });


}


window.onbeforeunload = function () {
    if ($('#tbVenta tbody tr').length > 0) {

        $('#tbVenta > tbody  > tr').each(function (index, tr) {
            var fila = tr;
            var productocantidad = parseInt($(fila).find("td.productocantidad").text());
            var idproducto = $(fila).find("td.producto").data("idproducto");

            controlarStock(parseInt(idproducto), parseInt($("#txtIdAgencia").val()), parseInt(productocantidad), false);
        });
    }
};S