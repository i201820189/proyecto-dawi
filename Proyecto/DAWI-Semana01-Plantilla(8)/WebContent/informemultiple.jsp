<jsp:include page="menu.jsp"></jsp:include>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html lang="esS">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css"/>
 

<title>Informe Multiple</title>
<style>
	.modal-header, h4, .close {
		background-color: #286090;
		color: white !important;
		text-align: center;
		font-size: 20px;
	}
	.help-block{
	 color: red;
	}
	
	.form-group.has-error .form-control-label {
	  color: red;
	}
	
	.form-group.has-error .form-control {
	  border: 1px solid red;
	  box-shadow: 0 0 0 0.2rem rgba(250, 16, 0, 0.18);
	}
	
	
	.dataTables_length{
	 display: none;
	}
	.dataTables_filter{
		text-align: right;
	}
	.dataTables_info{
	 display: none;
	}
	.dataTables_paginate{
		cursor: pointer;
	}
</style> 
</head>
<body>


<c:if test="${sessionScope.MENSAJE!=null}">
<div class="alert alert-warning alert-dismissible fade show" role="alert" id="success-alert">
  <strong>Sistema:</strong> ${sessionScope.MENSAJE}
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
</c:if>
<c:remove var="MENSAJE"/>

<!-- The Modal -->
  <div class="modal fade" id="myModal" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Sistema</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        	Seguro de eliminar el Informe Multiple? 
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <form action="deleteInformeMultiple" method="post" name="myForm">	
		  	  <input type="hidden" id="idNumero" name="codigo">
	             <button type="submit" class="btn btn-primary">SI</button>
	             <button type="button" class="btn btn-secondary" data-dismiss="modal">NO</button>
            </form>
        </div>
        
      </div>
    </div>
  </div>


<!-- The Modal Mensaje-->
  <div class="modal fade" id="myModalMensaje" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Sistema</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        	<p id="idMen"></p>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
           <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
	    </div>
        
      </div>
    </div>
  </div>

	<div class="container">
		<h3 align="center">Lista de Informes Multiples</h3>
		<button type="button" data-toggle='modal'  data-target="#idModalRegistra" id="idNuevo"
				class='btn btn-primary' >Nuevo Informe Multiple</button><br>&nbsp;<br>
				
				
				
		<div id="divEmpleado">
		 								<table id="idTable" class="table table-striped table-bordered" style="width:100%">
												<thead>
														<tr>
															<th>Codigo</th>
															<th>De</th>
															<th>Para</th>
															<th>Fecha Creacion</th>
															<th>Fecha Modificacion</th>
															<th>Asunto</th>
															<th>Motivo</th>
															<th>Unidad Organica</th>
															<th></th>
															
														</tr>
												</thead>
												<tbody>
												</tbody>
											</table>	

			</div>	
	
	
<!-- INICIO DIV NUEVO -->
<div class="modal fade bd-example-modal-lg" id="idModalRegistra" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 5px 20px">
					Registro de Informe Multiple<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          				
       				   </button>
				</div>
				<div class="modal-body" style="padding: 20px 20px;">
					<form id="idRegistra" accept-charset="UTF-8" action="saveInformeMultiple" 
													class="form-horizontal" method="post" data-toggle="validator" role="form">						
		                   				<input type="hidden" id="idCodigo" name="informeMultiple.idInformeMultiple" value="0">
		                   				
		                   					<div class="form-group col-md-3">
		                                        <label for="staticEmail">Fecha Modificacion</label>
													<input class="form-control" id="idFecha" name="informeMultiple.fec_modificacion" rows="3" cols="10" placeholder="Ingrese Fecha"></input>
		                                    </div>
		                   				
		                                	<div class="form-row">
		                                	<div class="form-group col-md-6"">
			                                   	<label for="staticEmail">De:</label>
												<input class="form-control" id="idDe" name="informeMultiple.de" placeholder="Ingrese el Remitente"/>
			                                </div>    
		                                    <div class="form-group col-md-6">
		                                       <label for="staticEmail">Para:</label>
		                                       <input class="form-control" id="idPara" name="informeMultiple.para" placeholder="Ingrese Receptor"/>
		                                    </div>
		                                    </div>
		                                                  
		                                    <div class="form-row">
			                                    <div class="form-group col-md-10">
			                                        <label for="staticEmail">Asunto</label>
														<input class="form-control" id="idAsunto" name="informeMultiple.asunto" placeholder="Ingrese Asunto"/>
			                                    </div>
			                                </div>    
		                                    <div class="form-group">
		                                        <label for="staticEmail">Motivo</label>
													<textarea class="form-control" id="idMotivo" name="informeMultiple.motivo" rows="3" cols="10" placeholder="Ingrese Motivo"></textarea>
		                                    </div>
		                                    <div class="form-group">
		                                        <label for="staticEmail">Unidad Organica</label>
													<select id="idUnidadOrganica" name="informeMultiple.idUnidadOrganica" class='form-control'>
							                                 <option value=" " >[SELECCIONE]</option>
							                         </select>
		                                    </div>
		                                    
                        				<div class="modal-footer">
									        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="btnCerrar">Cerrar</button>
									        <button type="submit" class="btn btn-primary">Guardar</button>
									    </div>

		            </form>      
				</div>
			</div>
		</div>
  </div>
  
  
</div>
  
<!-- FIN DIV NUEVO -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>

<script>
$(document).ready(function() {
	llenarUnidadOrganicas();
	llenarInformeMultiples();
});
</script>

<script type="text/javascript">
function llenarUnidadOrganicas(){
	$.getJSON("listaUnidadOrganica",{},
			function (data){
				$.each(data.listaUnidadOrganicas,function(index,item){
					$("#idUnidadOrganica").append("<option value='"+item.codigo+"'>"+item.nombre+"</option>");
				})	
	})
}

//variable global
var codPlan=0;

function llenarInformeMultiples(){
	$.getJSON("listAllInformeMultiples",{},
			function (data){
				$.each(data.listaInformeMultiples,function(index,item){
					var buscar="<button type='button' class='btn btn-secondary' data-toggle='modal'  id='idEditar' data-target='#idModalRegistra'>Editar</button>";
					var eliminar="<button type='button' class='btn btn-danger' data-toggle='modal' "+
								 "data-target='#myModal' id='idEliminar'>Eliminar</button>";
					$("#idTable").append("<tr><td>"+item.idInformeMultiple+"</td><td>"+item.de+"</td><td>"+item.para+ 
										 "</td><td>"+item.fec_creacion+"</td><td>"+item.fec_modificacion+"</td><td>"+item.asunto+"</td><td>"+item.motivo+"</td><td>"+item.nomUnidadOrganica+
										 "</td><td>"+buscar+"</td><td>"+eliminar+"</td></tr>");
				})	
				
				$("#idTable").DataTable();
				
	})
}

$("#success-alert").fadeTo(3000,1, function(){	
    $("#success-alert").slideUp(500);

});

$(document).on('click', '#idEliminar', function(){
    var id = $(this).parents("tr").find("td")[0].innerHTML;
    $("#idNumero").val(id);
})

$(document).on('click', '#idEditar', function(){
    var id = $(this).parents("tr").find("td")[0].innerHTML;
    $.getJSON("findInformeMultiple",{codigo:id},function (response){
    	//codPlan=response.informeMultiple.idInformeMultiple;
    	$("#idCodigo").val(response.informeMultiple.idInformeMultiple); 
		$("#idDe").val(response.informeMultiple.de);
		$("#idPara").val(response.informeMultiple.para);
		$("#idFecha").val(response.informeMultiple.fec_modificacion);
		$("#idAsunto").val(response.informeMultiple.asunto);
		$("#idMotivo").val(response.informeMultiple.motivo);
		$("#idUnidadOrganica").val(response.informeMultiple.idUnidadOrganica);
		$("#idUnidadOrganica").trigger("change");
		
		
		
        //invocar al evento change del select idLaboratorio
        
		
		
    })  
})
$(document).on('click', '#btnCerrar', function(){
	$('#idRegistra').data('bootstrapValidator').resetForm(true);
    $('#idRegistra').trigger("reset");
	$("#idCodigo").val(0); 
})

</script>

<script type="text/javascript">    
    $(document).ready(function(){     
        $('#idRegistra').bootstrapValidator({      
        	 fields:{
        		 
        		 Nombre: {
     	    		selector:'#idNombre',   
                    validators: {    
                        notEmpty: {    
                            message: 'Ingrese nombre'    
                        },      
                        regexp: {    
                            regexp: /^[a-zA-Z\s]+$/,    
                            message: 'The username can only consist of alphabetical, number, dot and underscore'    
                        },    
                    }    
                },   
                Descripcion: {
     	    		selector:'#idDescripcion',       
                    validators: {    
                        notEmpty: {    
                            message: 'Ingrese Descrpción'    
                        }   
                    }    
                },    
                Stock: {
     	    		selector:'#idStock',      
                    validators: {    
                        notEmpty: {    
                            message: 'Ingrese Stock'    
                        },       
                    }    
                },    
                Precio: {
     	    		selector:'#idPrecio',     
                    validators: {    
                        notEmpty: {    
                            message: 'Ingrese Precio'    
                        },       
                    }    
                }, 
                Fecha: {
     	    		selector:'#idFecha',   
                    validators: {    
                        notEmpty: {    
                            message: 'Ingrese Fecha'    
                        },					
                    }    
                },   				
                Laboratorio: {
     	    		selector:'#idLaboratorio',   
                    validators: {    
                        notEmpty: {    
                            message: 'Seleccione Laboratorio'    
                        },					
                    }    
                } 
        	 }
        });   
			
    });    
</script>   


</body>
</html>












