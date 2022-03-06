var tabladata;
$(document).ready(function () {
    activarMenu("Compras");


    ////validamos el formulario
    $("#form").validate({
        rules: {
            RUC: "required",
            RazonSocial: "required",
            Telefono: "required",
            Correo: "required",
            Direccion: "required"
        },
        messages: {
            RUC: "Debes completar los campos",
            RazonSocial: "Debes completar los campos",
            Telefono: "Debes completar los campos",
            Correo: "Debes ingresar un correo valido",
            Direccion: "Debes completar los campos"

        },
        errorElement: 'span'
    });


    tabladata = $('#tbdata').DataTable({
        "ajax": {
            "url": $.MisUrls.url._ObtenerProveedores,
            "type": "GET",
            "datatype": "json"
        },
        "columns": [
            { "data": "Ruc" },
            { "data": "RazonSocial" },
            { "data": "Telefono" },
            { "data": "Correo" },
            { "data": "Direccion" },
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
                "data": "IdProveedor", "render": function (data, type, row, meta) {
                    return "<button class='btn btn-primary btn-sm' type='button' onclick='abrirPopUpForm(" + JSON.stringify(row) + ")'><i class='fas fa-pen'></i></button>" //+
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
$("#txtRuc").inputFilter(function (value) {
    return /^-?\d*$/.test(value);
});
$("#txtRazonSocial").inputFilter(function (value) {
    return /^[a-zA-Z]*$/g.test(value);
});
$("#txtTelefono").inputFilter(function (value) {
    return /^-?\d*$/.test(value);
});

function abrirPopUpForm(json) {

    $("#txtid").val(0);

    if (json != null) {

        $("#txtid").val(json.IdProveedor);

        $("#txtRuc").val(json.Ruc);
        $("#txtRazonSocial").val(json.RazonSocial);
        $("#txtTelefono").val(json.Telefono);
        $("#txtCorreo").val(json.Correo);
        $("#txtDireccion").val(json.Direccion);
        $("#cboEstado").val(json.Activo == true ? 1 : 0);

    } else {
        $("#txtRuc").val("");
        $("#txtRazonSocial").val("");
        $("#txtTelefono").val("");
        $("#txtCorreo").val("");
        $("#txtDireccion").val("");
        $("#cboEstado").val(1);
    }

    $('#FormModal').modal('show');

}


function Guardar() {

    if ($("#form").valid()) {

        var request = {
            objeto: {
                IdProveedor: parseInt($("#txtid").val()),
                Ruc: $("#txtRuc").val(),
                RazonSocial: $("#txtRazonSocial").val(),
                Telefono: $("#txtTelefono").val(),
                Correo: $("#txtCorreo").val(),
                Direccion: $("#txtDireccion").val(),
                Activo: parseInt($("#cboEstado").val()) == 1 ? true : false
            }
        }

        jQuery.ajax({
            url: $.MisUrls.url._GuardarProveedor,
            type: "POST",
            data: JSON.stringify(request),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {

                if (data.resultado) {
                    tabladata.ajax.reload();
                    $('#FormModal').modal('hide');
                    swal("Mensaje", "Se registro el proveedor con exito", "Success")
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
        text: "¿Desea eliminar el proveedor seleccionado?",
        type: "warning",
        showCancelButton: true,

        confirmButtonText: "Si",
        confirmButtonColor: "#DD6B55",

        cancelButtonText: "No",

        closeOnConfirm: true
    },

        function () {
            jQuery.ajax({
                url: $.MisUrls.url._EliminarProveedor + "?id=" + $id,
                type: "GET",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {

                    if (data.resultado) {
                        tabladata.ajax.reload();
                    } else {
                        swal("Mensaje", "No se pudo eliminar el proveedor", "warning")
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