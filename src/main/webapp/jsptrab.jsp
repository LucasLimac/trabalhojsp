<%-- 
    Document   : jsptrab
    Created on : 24/03/2018, 12:10:45
    Author     : Lucas Lima
--%>

<%@page import="br.cefetrj.psw.jspalunoformtabela.Aluno"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Trabalho</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        
        
        
        <%
            ArrayList<Aluno> alunos = new ArrayList();
            alunos = (ArrayList)request.getAttribute("aluno");

        %>
            
         <table border='1px solid black collapse'>
             <tr>
                 <td>Aluno</td>
                 <td>Frequencia</td>
                 <td>Nota 1</td>
                 <td>Trabalho</td>
                 <td>Projeto</td>
                 <td>Média</td>
                 <td>Prova Final</td>
                 <td>Situacao</td>
                 
                 
             </tr>
             <%
                 for(int i = 0; i < alunos.size(); i++){
                     
                 
                 %>
             <tr>
                 <td><%= alunos.get(i).getNome() %></td>
                 <td><%= alunos.get(i).getFrequencia() %></td>
                 <td><%= alunos.get(i).getNota1() %></td>
                 <td><%= alunos.get(i).getTrabalho() %></td>
                 <td><%= alunos.get(i).getProjeto() %></td>
                 <td><%= alunos.get(i).getM1() %></td>
                 <td><%= alunos.get(i).getNotafinal() %></td>
                 <td><%= alunos.get(i).getSituacao() %></td>
                 
          
                 
             </tr>
                 <%
                     }
                 %>
            
                 <input type="submit" id="botao" value="Novo Aluno" onclick="location.href='http://localhost:8080/jspalunoformtabela/index.jsp'">
            
            
            
         </table>

    </body>
</html>

