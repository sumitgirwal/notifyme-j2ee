

var req;
function sendMail()
{
    req=new XMLHttpRequest();
    req.onreadystatechange=getOutput;
    var v=document.getElementById("email").value;
    
   
    req.open("get","sendMail?email="+v,true);
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