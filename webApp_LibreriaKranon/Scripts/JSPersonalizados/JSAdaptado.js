/// <reference path="../jquery-3.6.0.js" />

$(document).ready(function () {

    $("#btnAutor").click(function () {
        return LibrosPA();
        $("#ResultadoB").show();
        ClearTextbox();
    });

    $("#btnTitulo").click(function () {
        return LibrosPT();
        $("#ResultadoB").show();
        ClearTextbox();
    });

    $("#btnAnio").click(function () {
        return LibrosPAnio();
        $("#ResultadoB").show();
        ClearTextbox();
    });

    $("#btnEditorial").click(function () {
        return LibrosPEditorial();
        $("#ResultadoB").show();
        ClearTextbox();
    });

    $("#ResultadoB").hide();
    $("#detalles").hide();


});

function ClearTextbox() {

    $("#buscar").val("");
}

function DetaLibro(Titulo) {
    $.ajax({
        type: "get",
        url: "/Home/ObteberPT?Titulo=" + Titulo,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        cache: false,
        success: function (result) {
            var html = "";
            $.each(result, function (key, item) {
                html += "<tr>";
                html += "<td>" + item.Autor + "</td>";
                html += "<td>" + item.Titulo + "</td>";
                html += "<td>" + item.anio_publicacion + "</td>";
                html += "<td>" + item.Editorial + "</td>";
                html += "</tr>";
            })
            $("#detalles").show();
            $("#DLibros").html(html);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function LibrosPA() {
    var res = validaBuscar();
    if (res == false) {
        return false;
    }
    var Libro = {
        Autor: $("#buscar").val(),
    };
    $.ajax({
        url: "/Home/ObtenerPA",
        data: JSON.stringify(Libro),
        type: "POST",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {
            var html = "";
            $.each(result, function (key, item) {
                html += "<tr>";
                html += "<td>" + item.Autor + "</td>";
                html += "<td>" + item.Titulo + "</td>";
                html += '<td><a href="#" onclick="DetaLibro(\'' + item.Titulo + '\');">Detalles</a></td>';
                html += "</tr>";
            })
            $("#ResultadoB").show();
            $("#Libros").html(html);
        },
        error: function (errormessage) {
            alert("No se encontraron registros, verifique su busqueda");
        }
    });
}

function LibrosPT() {
    var res = validaBuscar();
    if (res == false) {
        return false;
    }
    var Libro = {
        Titulo: $("#buscar").val(),
    };
    $.ajax({
        url: "/Home/ObteberPT",
        data: JSON.stringify(Libro),
        type: "POST",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {
            var html = "";
            $.each(result, function (key, item) {
                html += "<tr>";
                html += "<td>" + item.Autor + "</td>";
                html += "<td>" + item.Titulo + "</td>";
                html += '<td><a href="#" onclick="DetaLibro(\'' + item.Titulo + '\');">Detalles</a></td>';
                html += "</tr>";
            })
            $("#ResultadoB").show();
            $("#Libros").html(html);
        },
        error: function (errormessage) {
            alert("No se encontraron registros, verifique su busqueda");
        }
    });
}

function LibrosPAnio() {
    var res = validaBuscar();
    if (res == false) {
        return false;
    }
    var Libro = {
        Anio: $("#buscar").val(),
    };
    $.ajax({
        url: "/Home/ObtenerPAnio",
        data: JSON.stringify(Libro),
        type: "POST",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {
            var html = "";
            $.each(result, function (key, item) {
                html += "<tr>";
                html += "<td>" + item.Autor + "</td>";
                html += "<td>" + item.Titulo + "</td>";
                html += '<td><a href="#" onclick="DetaLibro(\'' + item.Titulo + '\');">Detalles</a></td>';
                html += "</tr>";
            })
            $("#ResultadoB").show();
            $("#Libros").html(html);
        },
        error: function (errormessage) {
            alert("No se encontraron registros, verifique su busqueda");
        }
    });
}

function LibrosPEditorial() {
    var res = validaBuscar();
    if (res == false) {
        return false;
    }
    var Libro = {
        Editorial: $("#buscar").val(),
    };
    $.ajax({
        url: "/Home/ObtenerPE",
        data: JSON.stringify(Libro),
        type: "POST",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {
            var html = "";
            $.each(result, function (key, item) {
                html += "<tr>";
                html += "<td>" + item.Autor + "</td>";
                html += "<td>" + item.Titulo + "</td>";
                html += '<td><a href="#" onclick="DetaLibro(\'' + item.Titulo + '\');">Detalles</a></td>';
                html += "</tr>";
            })
            $("#ResultadoB").show();
            $("#Libros").html(html);
        },
        error: function (errormessage) {
            alert("No se encontraron registros, verifique su busqueda");
        }
    });
}

function validaBuscar() {
    var IsValid = true;

    if ($("#buscar").val().trim() == "") {
        $("#buscar").css("border-color", "red");
        $("#buscarV").html("Campo requerido");
        IsValid = false;
    } else {
        $("#buscar").css("border-color", "lightgray");
        $("#buscarV").hide();
        $("#buscarV").html("");
    }

    return IsValid;

}