/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
    
    var timer=60;
    var min=0;
    var sec=0;
    
    

    function startTimer(){
    	min=parseInt(timer/60);
    	sec=parseInt(timer%60);

    	if(timer<1){
            window.location="index.jsp";
        }
    		
    	document.getElementById("timer").innerHTML = "<b>Time Left: </b>"+min.toString()+":"+sec.toString();
    	timer--;
    	setTimeout(function(){ startTimer(); }, 1000);
    }