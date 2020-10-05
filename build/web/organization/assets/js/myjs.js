

var req;
function updateProblem()
{
    req=new XMLHttpRequest();
      alert("hell");
    req.onreadystatechange=getOutput;
    var v=document.getElementById("myproblem").value;
    alert(v);
    req.open("get","myproblem2.jsp?myproblem="+v,true);
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