<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script>

//HashMap : 사진 등록을 위해서
HashMap = function(){   
    this.map = new Array(); 
};   
HashMap.prototype = {   
    put : function(key, value){   
        this.map[key] = value; 
    },   
    get : function(key){   
        return this.map[key]; 
    },   
    getAll : function(){   
        return this.map; 
    },   
    clear : function(){   
        this.map = new Array(); 
    },   
    isEmpty : function(){     
         return (this.map.size() == 0); 
    }, 
    remove : function(key){     
         delete this.map[key]; 
    }, 
    toString : function(){ 
        var temp = ''; 
        for(i in this.map){   
            temp = temp + ',' + i + ':' +  this.map[i]; 
        } 
        temp = temp.replace(',',''); 
          return temp; 
    }, 
    keySet : function(){   
        var keys = new Array();   
        for(i in this.map){   
            keys.push(i); 
        }   
        return keys; 
    } 
}; 

//global 

mapB = new HashMap(); 


function ppppppplllllalllsllelll(){
	mapB.put("1", "1");
	alert("test "+mapB.toString());  
}
function ppppppplllllalllsllelll2(){
	mapB.put("2", "2");
	alert("test "+mapB.toString());  
}
</script>
</head>
<body>

<button onclick="ppppppplllllalllsllelll();"> 1 </button>
<button onclick="ppppppplllllalllsllelll2();"> 2 </button>
<a href="https://www.freeiconspng.com/img/45039">mouse cursor click png</a>
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M21 14.655l-5.799.908 3.393 6.917-3.111 1.52-3.413-6.982-4.07 3.651v-15.857l13 9.843m-12.792-10.905l-1.042.519-1.536-3.087 1.043-.519 1.535 3.087zm2.599-3.577l-1.152-.173-.513 3.409 1.152.173.513-3.409zm-4.779 5.848l.557-1.023-3.028-1.648-.557 1.023 3.028 1.648z"/></svg>
</body>
</html>