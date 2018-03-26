/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.cefetrj.psw.jspalunoformtabela;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *Servidor que adiciona as notas e situacao do aluno em um arraylist e imprime ele em uma tabela
 * @author Lucas Lima
 */
@WebServlet(name = "Servidortrab", urlPatterns = {"/Servidortrab"})
public class Servidortrab extends HttpServlet {

   ArrayList<Aluno> a = new ArrayList<>();
   
 /**
 *Metodo que recebe os dados do aluno como nota, trabalho, frequencia, projeto, nota final e imprime em uma tabela html
 * 
 */

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
      
        
        
        try{
            
        
            
        String aluno = (String)req.getParameter("aluno");

        double nota1 = Double.parseDouble(req.getParameter("nota1"));  
        double trabalho = Double.parseDouble(req.getParameter("trabalho"));    
        double projeto = Double.parseDouble(req.getParameter("projeto"));    
        double notafinal = Double.parseDouble(req.getParameter("notafinal"));    
        double frequencia = Double.parseDouble(req.getParameter("frequencia")); 
        
        double m1 = (0.7 * ((nota1 + trabalho) / 2)) + (projeto * 0.3);
  
    
        
        String situacao = situacao(frequencia, nota1, trabalho, projeto, notafinal);
        
           /**
            * boolean para ver se o form tá preenchido corretamente
            */
           boolean valido = true;
           req.setAttribute("erronota1",null);

           
           /**
            * if e else para verificar se a nota 1 está entre 0 e 10
            * se não estiver set uma mensagem de erro da nota 1
            */
           
           if( nota1 >= 0 && nota1 <= 10 ){
                    
               req.setAttribute("nota1", nota1);
               
           }
           
            else{
                req.setAttribute("aluno", aluno);
                req.setAttribute("erronota1", "A Nota 1 está no formato errado! Devem ser entre 0 e 10, repita:");
                valido = false;
            } 
           /**
            * if e else para verificar se a nota do trabalho está entre 0 e 10
            * se não estiver set uma mensagem de erro da nota do trabalho
            */
           
           if( trabalho >= 0 && trabalho <= 10 ){
                    
               req.setAttribute("trabalho", trabalho);
               
           }
           
            else{
                req.setAttribute("aluno", aluno);
                req.setAttribute("erroTrabalho", "A nota do Trabalho está no formato errado! Devem ser entre 0 e 10, repita:");
                valido = false;
            } 
           
           /**
            * if e else para verificar se a nota do projeto está entre 0 e 10
            * se não estiver set uma mensagem de erro da nota do projeto
            */
           
           if( projeto >= 0 && projeto <= 10 ){
                    
               req.setAttribute("projeto", projeto);
               
           }
           
            else{
                req.setAttribute("aluno", aluno);
                req.setAttribute("erronota1", "A nota do Projeto está no formato errado! Devem ser entre 0 e 10, repita:");
                valido = false;
            } 
           
           /**
            * if e else para verificar se a nota final está entre 0 e 10
            * se não estiver set uma mensagem de erro da nota final
            */
            
           
           if( notafinal >= 0 && notafinal <= 10 ){
                    
               req.setAttribute("notafinal", notafinal);
               
           }
           
            else{
                req.setAttribute("aluno", aluno);
                req.setAttribute("erroNotafinal", "A nota da prova final está no formato errado! Devem ser entre 0 e 10, repita:");
                valido = false;
            } 
           
           /**
            * if e else para a frequencia que deve ser entre 0 e 100
            * se não estiver entre esse valor, seta uma mensagem de erro
            */
           
           if( frequencia >= 0 && frequencia <= 100 ){
                    
               req.setAttribute("frequencia", frequencia);
               
           }
           
            else{
                req.setAttribute("aluno", aluno);
                req.setAttribute("erroFrequencia", "A frequencia está errada! Devem ser entre 0 e 100, repita:");
                valido = false;
            } 
           
           
           /**
            * if e else para se o o form foi preenchido corretamente
            * se não for volta para o formulário
            */
           
           
           
           if(valido){
                a.add(new Aluno(aluno, nota1, frequencia, trabalho, projeto, notafinal,m1, situacao));
                req.setAttribute("aluno", a);
                req.setAttribute("erronota1",null);
                req.setAttribute("erroFrequencia", null);
                req.getRequestDispatcher("/jsptrab.jsp").forward(req, resp);
                
           }
           else{
               req.getRequestDispatcher("/index.jsp").forward(req, resp);
           }
           

        
         
        }catch(Exception e){
            
            resp.getWriter().print("erro");
        }
        
    }
    
       /**
 *
 * Metodo que retorna a situacao de um Aluno
 * frequencia = frequencia de presenca do aluno nas aulas
 * p1 = nota da primeira prova
 * trabalho = nota do trabalho
 * projeto = nota dos projetos feitos em aula
 * pf = nota da pf, caso o aluno tenha ficado em pf
 */
    
    public String situacao(double frequencia, double p1, double trabalho, double projeto, double pf){
         double m1 = (0.7 * ((p1 + trabalho) / 2)) + (projeto * 0.3);
         String situacao;
         
        if(frequencia >= 75){
            if(m1 >= 7) 
                situacao= "Aprovado";
            else if (m1 < 3) 
                situacao = "Reprovado";
            else{
                
                if( ((pf + m1) / 2) >= 5)
                    situacao = "Aprovado";
                else
                    situacao = "Reprovado";
            }
        }else{
            situacao= "Reprovado";
        }
    
        return situacao;
    }

    

}