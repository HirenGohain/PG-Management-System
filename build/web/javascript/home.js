var nav = document.querySelector("nav");
var user = document.getElementById("user").addEventListener('click',fun);

function fun(){
    document.querySelector(".tenant").style.display = "none";
    document.querySelector(".admin").style.display = "none";
    if(nav.style.display == "none"){
        nav.style.display = "block";
    }
    else{
        nav.style.display = "none";
    }
}

var tenant = document.getElementById("tenant").addEventListener('click',function(){
    nav.style.display = "none";
    document.querySelector(".tenant").style.display = "block";
})


var admin = document.getElementById("admin").addEventListener('click',function(){
    nav.style.display = "none";
    document.querySelector(".admin").style.display = "block";
})

var close_tenant = document.getElementById("close_tenant").addEventListener('click',function(){
    document.querySelector(".tenant").style.display = "none";
})

var close_admin = document.getElementById("close_admin").addEventListener('click',function(){
    document.querySelector(".admin").style.display = "none";
})


