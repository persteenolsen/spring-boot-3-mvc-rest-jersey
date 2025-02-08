<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
	<title>A Java Spring Boot JAX-RS Jersey REST JPA Web application</title>
	
	
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  
	<style>
		.header-text {Color: Green; font-family: Verdana, sans-serif; font-size: 14pt}
		.body-content{margin-left: 10pt; margin-right: 10pt; font-family: Verdana, sans-serif}

        .col-xs-12 {
        padding-top: 10px;
    }


        .col-xs-12 > input {
            width: 100%;
        }



    .btn {
        min-width: 150px;
    }


    .btn-block {
        width: 100%;
    }


    input[type=text] {
        padding-top: 2px;
        border-radius: 5px;
        border: 1px ridge black;
    }


    select {
        color: white;
        min-height: 30px;
        width: 100%;
        background-color: rgb(51, 122, 183);
    }

	</style>

</head>
  
<body>

	
<jsp:include page="header_menu.jsp" />
	
   
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.0.3.min.js"></script>

<script>

      // Funktionen kaldes når DOM er loadet, og fylder DropDownListen op med personernes navne via kaldet GetAllPersonsDropDownList();
      $( document ).ready(function() {

          GetAllPersonsDropDownList();

      })


</script>


<div class="container">

        <div class="header-text" >${messageclientjerseyrest}</div>

<div class="row">


    <!--Venstre/førrste del starter-->
    <div class="col-xs-12 col-sm-8 col-md-8">

        <!--Nested grid til 2 kolonner/1 kolonne vedr. tekst/input-felt-->
        <div class="row">
            <div class="col-xs-12 col-sm-3 col-md-3">
                Select a person:<br />

            </div>
            <div class="col-xs-12 col-sm-3 col-md-3">
                <select id="ListPersonsId" size="1"></select>
            </div>
        </div>


        <div class="row">
            <div class="col-xs-12 col-sm-3 col-md-3">
                Id:
            </div>
            <div class="col-xs-12 col-sm-3 col-md-3">
                <input readonly type="text" id="txtPutPostId" />
            </div>
        </div>


        <div class="row">
            <div class="col-xs-12 col-sm-3 col-md-3">
               * Name:
                <br/>
                 (Length 2 to 30 letters)
            </div>
            <div class="col-xs-12 col-sm-3 col-md-3">
                <input type="text" id="txtaddNavn" />
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12 col-sm-3 col-md-3">
               * Email:
               <br/>(xxx@yyy.com)
            </div>
            <div class="col-xs-12 col-sm-3 col-md-3">
                <input type="text" id="txtaddEmail" />
            </div>
        </div>

        <div class="row">

            <div class="col-xs-12 col-sm-3 col-md-3">
              * Age:
              <br/>(Number from 18 to 125)
            </div>
            <div class="col-xs-12 col-sm-3 col-md-3">
                <input type="text" id="txtaddAlder" />
            </div>
        
        
        </div><br/>
        Fields marked with * are required !
        <br/>

        <!--Nested 1 kolonne vedr de 4 knapper-->
        <div class="row">

            <div class="col-xs-12 col-sm-3 col-md-3">
                <button class="btn btn-block btn-warning" onclick="EditPerson();">Edit Person</button>
            </div>


            <div class="col-xs-12 col-sm-3 col-md-3">
                <button class="btn btn-block btn-danger" onclick="DeletePerson();">Delete Person</button>
            </div>

            <div class="col-xs-12 col-sm-3 col-md-3">
                <button class="btn btn-block btn-success" onclick="ClearPerson();return false;">Clear</button>
            </div>

            <div class="col-xs-12 col-sm-3 col-md-3">
                <button class="btn btn-block btn-primary" onclick="AddPerson();">Add Person</button>
            </div>
        </div>


        <!--Venstre/øverste slutter-->
    </div>


    <!--Højre/nederste kolonne starter-->
    <div class="col-xs-12 col-sm-4 col-md-4">
        
        <button class="btn btn-block btn-primary" onclick="GetAllPersons();return false;">Show all Persons</button>

        <br /><br />

        <!--Denne div indeholder alle personers data der kan hentes vi api-kald-->
        <div id="divResult"></div>

        <!--Højre/nederste kolonne slutter-->
    </div>

</div>

</div>


<script type="text/javascript">

               // DropDownListen fyldes med alle personernes fornavn og efternavn, og Id som value
               function GetAllPersonsDropDownList() {

                   // Tømmer lige listen, da denne funktion kaldes efter add, edit og delete person
                   $('#ListPersonsId').empty();

                   $.ajax({
                       url: 'jax-rs/person-jersey/persons/',
                       type: 'GET',
                       dataType: 'json',
                       
                       success: function (data) {

                           $.each(data, function (index, data) {

                               $('#ListPersonsId').append($('<option></option>').val(data.id).html(data.name));

                           });

                       },
                       error: function (x, y, z) {
                           //alert(x + '\n' + y + '\n' + z);
                           var statuscode = x.status;
                           var statustext = x.statusText;
                           var messages = "Something went wrong!";
                           alert(statustext + '\n' + statuscode + '\n\n' + messages );
                       }
                   });
               }



               // Koden kaldes når der vælges en person fra DropDownListen og person input-felterne udfyldes via api kald gennem funtionen GetPerson via valgt Person Id
               $('#ListPersonsId').change(function () {

                   var selectedvalS = $('#ListPersonsId option:selected').val();
                   
                   GetPerson(selectedvalS);

               }
              );

               // Funktionen viser alle personer via api kald
               function GetAllPersons() {
                  
                   $.ajax({
                       url: 'jax-rs/person-jersey/persons/',
                       type: 'GET',
                       dataType: 'json',
                       
                       success: function (data) {

                           WriteResponse(data);
                       },
                       error: function (x, y, z) {
                           //alert(x + '\n' + y + '\n' + z);
                           var statuscode = x.status;
                           var statustext = x.statusText;
                           var messages = "Something went wrong!";
                           alert(statustext + '\n' + statuscode + '\n\n' + messages );
                       }
                   });
               }



               // Funktionen udfylder inputfelterne fra den person der blev valgt fra DropDownListen via api-kald
               function GetPerson(id) {

                   $.ajax({
                       url: 'jax-rs/person-jersey/person/' + id,
                       type: 'GET',
                       dataType: 'json',
                       success: function (data) {
                           ShowPerson(data);
                       },
                       error: function (x, y, z) {
                           //alert(x + '\n' + y + '\n' + z);
                           var statuscode = x.status;
                           var statustext = x.statusText;
                           var messages = "Something went wrong!";
                           alert(statustext + '\n' + statuscode + '\n\n' + messages );
                       }
                   });
               }




               function AddPerson() {
                   //jQuery.support.cors = true;
                   var person = {
                       name: $('#txtaddNavn').val(),
                       email: $('#txtaddEmail').val(),
                       age: $('#txtaddAlder').val()
                      
                   };


                   $.ajax({
                       url: 'jax-rs/person-jersey/person/',
                       type: 'POST',
                       data: JSON.stringify(person),
                       contentType: "application/json;charset=utf-8",
                       success: function (data) {

                           alert("The person was added!");

                           ClearPerson();

                           GetAllPersonsDropDownList();

                           GetAllPersons();
                       },
                       error: function (x, y, z) {
                           //var responseText = jQuery.parseJSON(x.responseText);
                           //alert(z + '\n\n' + responseText.Message);

                           var statuscode = x.status;
                           var statustext = x.statusText;
                           var messages = "Something went wrong, please try to add a person again!";
                          // if(statuscode==400)
                          //     messages = "Please make sure to enter valid values!";
                               
                           alert(statustext + '\n' + statuscode + '\n\n' + messages );

                       }

                   });
               }



            function EditPerson() {
                   //jQuery.support.cors = true;

                       var id = $('#txtPutPostId').val();

                       var person = {
                           id: $('#txtPutPostId').val(),
                           name: $('#txtaddNavn').val(),
                           email: $('#txtaddEmail').val(),
                           age: $('#txtaddAlder').val()
                           
                       };



                       $.ajax({
                           url: 'jax-rs/person-jersey/person/' + id,
                           type: 'PUT',

                           data: JSON.stringify(person),
                           contentType: "application/json;charset=utf-8",

                           success: function (data) {

                               alert("The person was edited!");
                               GetAllPersons();

                               GetAllPersonsDropDownList();
                           },
                           error: function (x, y, z) {
                               //var responseText = jQuery.parseJSON(x.responseText);
                               //alert(z + '\n\n' + responseText.Message);
                              var statuscode = x.status;
                              var statustext = x.statusText;
                              var messages = "Something went wrong, please try edit the person again!";
                              //if(statuscode==400)
                              //    messages = "Please make sure to enter valid values!";
                               
                               alert(statustext + '\n' + statuscode + '\n\n' + messages );
                           }


                       });

               }



               function DeletePerson() {
                   //jQuery.support.cors = true;

                   var id = $('#txtPutPostId').val();

                   
                   $.ajax({
                       url: 'jax-rs/person-jersey/person/' + id,
                       type: 'DELETE',
                       contentType: "application/json;charset=utf-8",
                       success: function (data) {


                           alert("The person was deleted!");
                           ClearPerson();

                           GetAllPersonsDropDownList();

                           GetAllPersons();
                       },
                       error: function (x, y, z) {
                           //alert(x + '\n' + y + '\n' + z);
                           var statuscode = x.status;
                           var statustext = x.statusText;
                           var messages = "Something went wrong!";
                           alert(statustext + '\n' + statuscode + '\n\n' + messages );
                       }
                   });

               }


               // Her skabes der en tabel med alle personerne via api kald
               function WriteResponse(persons) {

                   // Profession added to display the new DB Column
                   var strResult = "<table style='width:100%'>";
                   strResult += "<tr><td>ID</td><td>Name</td><td>Email</td><td>Age</td></tr>";

                   $.each(persons, function (index, person) {

                       // Profession added to display the new DB Column
                       strResult += "<tr><td>" + person.id + "</td><td>" + person.name + "</td><td>" + person.email + "</td><td>" + person.age + "</td></tr>";


                   });
                   strResult += "</table>";
                   $("#divResult").html(strResult);

               }



               // Funktioen kaldes fra GetPerson, der igen kaldes n�r der v�lges en person fra DropDownListen af personer
               function ShowPerson(person) {
                   if (person != null) {


                       $('#txtPutPostId').val(person.id);
                       $('#txtaddNavn').val(person.name);
                       $('#txtaddEmail').val(person.email);
                       $('#txtaddAlder').val(person.age);
                      
                   }
                   else {
                       $("#divResult").html("No Results To Display");
                   }
               }


               // Ved tryp på knappen Clear, ryddes alle felter samt listen med personer.
               function ClearPerson() {

                   $("#divResult").html("");

                   $('#txtPutPostId').val("");
                   $('#txtaddNavn').val("");
                   $('#txtaddEmail').val("");
                   $('#txtaddAlder').val("");
                  

               }


   </script>

</body>
</html>