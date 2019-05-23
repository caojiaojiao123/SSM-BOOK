 //1.得到XMLHttpRequset对象

    function getXMLHttpRequest(){
    	
    	try{//非IE浏览器
    		
    		return new XMLHttpRequest();
    		
    	}catch(e){
    		
    		try{//IE低版本的
    			
    			return new ActiveXObject("Microsoft.XMLHTTP");
    			
    		}catch(e){
    			
    			try{//IE高版本的
    				
    				return new ActiveXObject("Msxml2.XMLHTTP");
    				
    			}catch(e){
    				
    			alert("你用的浏览器不合法，请换一个吧！")	;
    			
    			throw e;
    				
    			}
    			
    		}
    	}
    }
    
    function ajax(opt){
    	
    	var http=getXMLHttpRequest();
    	
    	if(!opt.method){
    		
    		opt.method="GET";
    	}
    	
    	if(opt.ansy==undefined){
    		
    		opt.ansy=true;
    	}
    	
    	http.open(opt.method,opt.url,opt.ansy);
    	
    	if(opt.method=="POST"){
    		
    		http.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    	}
    	
    	http.send(opt.params);
    	
    	http.onreadystatechange=function(){
    		
    		if(http.readyState==4 && http.status==200){
    			
    			var data;
    			
    			if(!opt.type){
    				
    				data=http.responseText;
    			}
    			
    			if(opt.type=="text"){
    			
    			    data=http.responseText;
    			
    			}else if(opt.type=="xml"){
    			
    				data=http.responseXML;
    				
    			}else if(opt.type=="json"){
    			
    				var content=http.responseText;
    				
    				data=eval("("+content+")");
    			}
    			
    			opt.success(data);
    		}
    	}
    }
