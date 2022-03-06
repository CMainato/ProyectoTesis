
var tabladata;
$(document).ready(function () {
    activarMenu("Ventas");


    ////validamos el formulario
    $("#form").validate({
        rules: {
           
            RazonSocial: "required",
            Telefono: "required",
            Direccion: "required"
        },
        messages: {
           
            RazonSocial: "(*)",
            Telefono: "(*)",
            Direccion: "(*)"

        },
        errorElement: 'span'
    });


    tabladata = $('#tbTienda').DataTable({
        "ajax": {
            "url": $.MisUrls.url._ObtenerAgencia,
            "type": "GET",
            "datatype": "json"
        },
        "columns": [
            { "data": "Nombre" },
         
            { "data": "Direccion" },
            { "data": "Telefono" },
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
                "data": "IdAgencia", "render": function (data, type, row, meta) {
                    return "<button class='btn btn-primary btn-sm' type='button' onclick='abrirPopUpForm(" + JSON.stringify(row) + ")'><i class='fas fa-pen'></i></button>" //+
                     //   "<button class='btn btn-danger btn-sm ml-2' type='button' onclick='eliminar(" + data + ")'><i class='fa fa-trash'></i></button>"
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

        $("#txtid").val(json.IdAgencia);

        $("#txtNombre").val(json.Nombre);
       
        $("#txtDireccion").val(json.Direccion);
        $("#txtTelefono").val(json.Telefono);
        $("#cboEstado").val(json.Activo == true ? 1 : 0);

    } else {
        $("#txtNombre").val("");
        $("#txtDireccion").val("");
        $("#txtTelefono").val("");
      
        $("#cboEstado").val(1);
    }

    $('#FormModal').modal('show');

}


function Guardar() {

    if ($("#form").valid()) {

        var request = {
            objeto: {
                IdAgencia: parseInt($("#txtid").val()),
                Nombre: $("#txtNombre").val(),
                Direccion: $("#txtDireccion").val(),
                Telefono: $("#txtTelefono").val(),
                Activo: ($("#cboEstado").val() == "1" ? true : false)
            }
        }

        jQuery.ajax({
            url: $.MisUrls.url._GuardarAgencia,
            type: "POST",
            data: JSON.stringify(request),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {

                if (data.resultado) {
                    tabladata.ajax.reload();
                    $('#FormModal').modal('hide');
                    swal("Mensaje", "Se registro la agencia con exito!", "Success")
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
        text: "¿Desea eliminar la agencia seleccionada?",
        type: "warning",
        showCancelButton: true,

        confirmButtonText: "Si",
        confirmButtonColor: "#DD6B55",

        cancelButtonText: "No",

        closeOnConfirm: true
    },

        function () {
            jQuery.ajax({
                url: $.MisUrls.url._EliminarAgencia + "?id=" + $id,
                type: "GET",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {

                    if (data.resultado) {
                        tabladata.ajax.reload();
                        alert('Agencia eliminado!');
                    } else {
                        alert('La Agencia no se puede eliminado!');
                        swal("Mensaje", "No se pudo eliminar la agencia", "warning")
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