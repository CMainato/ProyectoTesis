$(document).ready(function () {
    $('#show_password').hover(function show() {
        //Cambiar el atributo a texto
        $('#clave').attr('type', 'text');
        $('.icon').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
    },
        function () {
            //Cambiar el atributo a contraseña
            $('#clave').attr('type', 'password');
            $('.icon').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
        });
   
});

