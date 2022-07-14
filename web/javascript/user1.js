var nav = document.querySelector("nav");
var nav_item = document.getElementById("nav-item");
nav_item.addEventListener('click',fun);


//function for nav item...
function fun(){
    document.querySelector(".due").style.display = "none";
    document.querySelector(".query").style.display = "none";
    document.querySelector(".query").style.display = "none";
    document.querySelector(".change-password").style.display = "none";
    document.querySelector(".conf-message").style.display = "none";
    if(nav.style.display == "none"){
        nav.style.display = "block";
        nav_item.style.transform = "rotateZ(90deg)"
    }
    else{
        nav.style.display = "none";
        nav_item.style.transform = "rotateZ(0deg)"
    }
}

var due = document.getElementById("due").addEventListener('click',function(){
    nav.style.display = "none";
    nav_item.style.transform = "rotateZ(0deg)"
    document.querySelector(".due").style.display = "block";
})
var close_due = document.getElementById("close-due").addEventListener('click',function(){
    document.querySelector(".due").style.display = "none";
})

var query = document.getElementById("query").addEventListener('click',function(){
    nav.style.display = "none";
    nav_item.style.transform = "rotateZ(0deg)"
    document.querySelector(".query").style.display = "block";
})
var close_query = document.getElementById("close-query").addEventListener('click',function(){
    document.querySelector(".query").style.display = "none";
})

var change_password = document.getElementById("change-password").addEventListener('click',function(){
    nav.style.display = "none";
    nav_item.style.transform = "rotateZ(0deg)"
    document.querySelector(".change-password").style.display = "block";
})
var close_change_password = document.getElementById("close-change-password").addEventListener('click',function(){
    document.querySelector(".change-password").style.display = "none";
})

var logout = document.getElementById("logout").addEventListener('click',function(){
    nav.style.display = "none";
    nav_item.style.transform = "rotateZ(0deg)";
    document.querySelector(".conf-message").style.display = "block";
})


