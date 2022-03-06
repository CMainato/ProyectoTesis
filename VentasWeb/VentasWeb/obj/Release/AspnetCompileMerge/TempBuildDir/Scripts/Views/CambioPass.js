$(document).ready(function () {
    activarMenu("Home");

})
function ver1() {
    $('#show_password1').hover(function show() {
        //Cambiar el atributo a texto
        $('#Clave').attr('type', 'text');
        $('.icon1').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
    },
        function () {
            //Cambiar el atributo a contraseña
            $('#Clave').attr('type', 'password');
            $('.icon1').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
        });
}
function ver2() {
    $('#show_password2').hover(function show() {
        //Cambiar el atributo a texto
        $('#newPass').attr('type', 'text');
        $('.icon2').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
    },
        function () {
            //Cambiar el atributo a contraseña
            $('#newPass').attr('type', 'password');
            $('.icon2').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
        });
}
function ver3() {
    $('#show_password3').hover(function show() {
        //Cambiar el atributo a texto
        $('#conPass').attr('type', 'text');
        $('.icon3').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
    },
        function () {
            //Cambiar el atributo a contraseña
            $('#conPass').attr('type', 'password');
            $('.icon3').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
        });
}
 
 
   
let timeout;

// traversing the DOM and getting the input and span using their IDs

let password = document.getElementById('newPass')
let strengthBadge = document.getElementById('StrengthDisp')

// The strong and weak password Regex pattern checker

let strongPassword = new RegExp('((?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^A-Za-z0-9])(?=.{6,}))|((?=.*[a-z])(?=.*[A-Z])(?=.*[^A-Za-z0-9])(?=.{8,}))')
let mediumPassword = new RegExp('(?=.*[a-z])(?=.{8,})') 

function StrengthChecker(PasswordParameter) {
    // We then change the badge's color and text based on the password strength

    if (strongPassword.test(PasswordParameter)) {
        strengthBadge.style.backgroundColor = "green"
        strengthBadge.textContent = 'Contraseña Segura'
    } else if (mediumPassword.test(PasswordParameter)) {
        strengthBadge.style.backgroundColor = 'blue'
        strengthBadge.textContent = 'Contraseña media'
    } else {
        strengthBadge.style.backgroundColor = 'red'
        strengthBadge.textContent = 'Contraseña Debil'
    }
}

// Adding an input event listener when a user types to the  password input 

password.addEventListener("input", () => {

    //The badge is hidden by default, so we show it

    strengthBadge.style.display = 'block'
    clearTimeout(timeout);

    //We then call the StrengChecker function as a callback then pass the typed password to it

    timeout = setTimeout(() => StrengthChecker(password.value), 500);

    //Incase a user clears the text, the badge is hidden again

    if (password.value.length !== 0) {
        strengthBadge.style.display != 'block'
    } else {
        strengthBadge.style.display = 'none'
    }
});