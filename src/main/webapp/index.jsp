<%-- 
    Document   : index
    Created on : 26/03/2018, 15:54:05
    Author     : Lucas Lima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       
        
        <style>
            
            table{
                background-color: #66CDAA;
                border-collapse: collapse;
                font-family: Verdana 14;
                padding: 100px;
                margin-top: 100px; 
                width: 1000px;
            }
           
            form{
                margin-top: 50px;
                padding: 20px;
                background-color: #C0C0C0;
                font-family: cursive; 
                margin-bottom: 100px;
                
                
                
                
            }
            input[type='text']{
                margin-top: 10px;
                margin-bottom: 10px;
                width: 100%;
                padding: 5px 10px;
                box-sizing: border-box;
                border: 1px solid black;
                border-radius: 4px;
            }
            
            input[type='submit']{
                margin-top: 20px;
                margin-left: 450px;
                border: 1px solid black;
                border-radius: 4px;
                padding: 3px;
                font-family: monospace;
                
            }
            input[type='reset']{
                margin-top: 20px;
                padding: 3px;
                border: 1px solid black;
                border-radius: 4px;
                font-family: monospace;
                
            }
            legend{
                font-size: 30px;
                font-family: monospace;  
                margin-left: 170px;
                
            }
            
        
        </style>
    </head>
    <body>
        <div>
 
            <form action="Servidortrab" method="POST">
                <fieldset>
                    <legend>Portal do Aluno</legend>
                    
                Aluno:<br>
                
                <input type="text" name="aluno" value="<%= request.getAttribute("aluno") != null ? request.getAttribute("aluno") : "" %>" ><br>
                  Frequencia:<br>
                
                  <input type="text" name="frequencia" value="<%= request.getAttribute("frequencia") != null ? request.getAttribute("frequencia") : "" %>"><br>
                
                  Nota 1:<br>
                
                  <input type="text" name="nota1" value="<%= request.getAttribute("nota1") != null ? request.getAttribute("nota1") : "" %>" ><br>
                
                Trabalho:<br>
                
                  <input type="text" name="trabalho" value="<%= request.getAttribute("trabalho") != null ? request.getAttribute("trabalho") : "" %>" ><br>
                  Projeto:<br>
                
                  <input type="text" name="projeto" value="<%= request.getAttribute("projeto") != null ? request.getAttribute("projeto") : "" %>" ><br>
                
                
                
                Prova Final:<br>
                
                  <input type="text" name="notafinal" value="<%= request.getAttribute("notafinal") != null ? request.getAttribute("notafinal") : "" %>" ><br>
                
                <h2><%= request.getAttribute("erronota1") == null ? "" : request.getAttribute("erronota1") %></h2>
                <h2><%= request.getAttribute("erroTrabalho") == null ? "" : request.getAttribute("erroTrabalho") %></h2>
                <h2><%= request.getAttribute("erroProjeto") == null ? "" : request.getAttribute("erroProjeto") %></h2>
                <h2><%= request.getAttribute("erroNotafinal") == null ? "" : request.getAttribute("erroNotafinal") %></h2>
                
                <h2><%= request.getAttribute("erroFrequencia") == null ? "" : request.getAttribute("erroFrequencia") %></h2>

                
                <input type="submit" id="botao" value="Enviar">
                
                <input type="reset" value="Limpar">
                    
                 </fieldset>   
                
            
            
            </form>
        
        
        </div>
    </body>
</html>
