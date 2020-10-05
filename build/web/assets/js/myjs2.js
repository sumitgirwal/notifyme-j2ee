

var req;
function sendMail()
{
    req=new XMLHttpRequest();
    req.onreadystatechange=getOutput;
    var v1=document.getElementById("email").value;
    var v2=document.getElementById("uid").value;
    
   
    req.open("get","sendMail2?email="+v1+"&uid="+v2,true);
    req.send(null);
}

function getOutput()
{
    if(req.status==200 && req.readyState==4)
    {
        var s=req.responseText;
        alert(s);
    }  
}