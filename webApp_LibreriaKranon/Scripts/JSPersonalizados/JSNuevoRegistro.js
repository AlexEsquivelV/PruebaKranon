/// <reference path="../jquery-3.6.0.js" />

$(document).ready(function () {

    $("#ShowModal").click(function () {
        ClearTextbox();
    });

    $("#btnAdd").click(function () {
        return Agregar();

    });

    $("#Autor").focusout(function () {
        var res = validate();
        if (res == false) {
            return false;
        }
    });

    $("#Titulo").focusout(function () {
        var res = validate();
        if (res == false) {
            return false;
        }
    });

    $("#anio_publicacion").focusout(function () {
        var res = validate();
        if (res == false) {
            return false;
        }
    });

    $("#Editorial").focusout(function () {
        var res = validate();
        if (res == false) {
            return false;
        }
    });

});

function ClearTextbox() {

    $("#Autor").val("");
    $("#Titulo").val("");
    $("#anio_publicacion").val("");
    $("#Editorial").val("");
    $("#AutorAdd").html("");
    $("#TituloAdd").html("");
    $("#AnioAdd").html("");
    $("#EditorialAdd").html("");
    $("#btnAdd").show();
    $("#Autor").css("border-color", "lightgrey");
    $("#Titulo").css("border-color", "lightgrey");
    $("#anio_publicacion").css("border-color", "lightgrey");
    $("#Editorial").css("border-color", "lightgrey");

};

function Agregar() {
    var res = validate();
    if (res == false) {
        return false;
    }
    var Persona = {
        Autor: $("#Autor").val(),
        Titulo: $("#Titulo").val().trim(),
        anio_publicacion: $("#anio_publicacion").val(),
        Editorial: $("#Editorial").val()
    };
    $.ajax({
        url: "/Home/Agregar",
        data: JSON.stringify(Persona),
        type: "POST",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (e) {
            if (e.esError) {
                alert(e.mensaje);
                return;
            }
            $("#exampleModal").modal("hide");
            alert("Registros exitosos: " + e.agre);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
};

function validate() {
    var IsValid = true;

    if ($("#Autor").val().trim() == "") {
        $("#Autor").css("border-color", "red");
        $("#AutorAdd").html("Campo requerido");
        IsValid = false;
    } else {
        $("#Autor").css("border-color", "lightgray");
        $("#AutorAdd").hide();
        $("#AutorAdd").html("");
    }

    if ($("#Titulo").val().trim() == "") {
        $("#Titulo").css("border-color", "red");
        $("#TituloAdd").html("Campo requerido");
        IsValid = false;
    } else {
        $("#Titulo").css("border-color", "lightgray");
        $("#TituloAdd").hide();
        $("#TituloAdd").html("");
    }

    if ($("#anio_publicacion").val().trim() == "") {
        $("#anio_publicacion").css("border-color", "red");
        $("#AnioAdd").html("Campo requerido");
        IsValid = false;
    } else {
        $("#anio_publicacion").css("border-color", "lightgray");
        $("#AnioAdd").hide();
        $("#AnioAdd").html("");
    }

    if ($("#Editorial").val().trim() == "") {
        $("#Editorial").css("border-color", "red");
        $("#EditorialAdd").html("Campo requerido");
        IsValid = false;
    } else {
        $("#Editorial").css("border-color", "lightgray");
        $("#EditorialAdd").hide();
        $("#EditorialAdd").html("");
    }

    return IsValid;
};