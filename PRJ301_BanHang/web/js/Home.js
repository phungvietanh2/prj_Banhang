let menu = document.querySelector('#menu-bars');
let navbar = document.querySelector('.navbar');

menu.onclick = () =>{
  menu.classList.toggle('fa-times');
  navbar.classList.toggle('active');
}

let section = document.querySelectorAll('section');
let navLinks = document.querySelectorAll('header .navbar a');

window.onscroll = () =>{

  menu.classList.remove('fa-times');
  navbar.classList.remove('active');

  section.forEach(sec =>{

    let top = window.scrollY;
    let height = sec.offsetHeight;
    let offset = sec.offsetTop - 150;
    let id = sec.getAttribute('id');

    if(top >= offset && top < offset + height){
      navLinks.forEach(links =>{
        links.classList.remove('active');
        document.querySelector('header .navbar a[href*='+id+']').classList.add('active');
      });
    };

  });

}

document.querySelector('#search-icon').onclick = () =>{
  document.querySelector('#search-form').classList.toggle('active');
}

document.querySelector('#close').onclick = () =>{
  document.querySelector('#search-form').classList.remove('active');
}

var swiper = new Swiper(".home-slider", {
  spaceBetween: 30,
  centeredSlides: true,
  autoplay: {
    delay: 7500,
    disableOnInteraction: false,
  },
  pagination: {
    el: ".swiper-pagination",
    clickable: true,
  },
  loop:true,
});

var swiper = new Swiper(".review-slider", {
  spaceBetween: 20,
  centeredSlides: true,
  autoplay: {
    delay: 7500,
    disableOnInteraction: false,
  },
  loop:true,
  breakpoints: {
    0: {
        slidesPerView: 1,
    },
    640: {
      slidesPerView: 2,
    },
    768: {
      slidesPerView: 2,
    },
    1024: {
      slidesPerView: 3,
    },
  },
});

function loader(){
  document.querySelector('.loader-container').classList.add('fade-out');
}

function fadeOut(){
  setInterval(loader, 3000);
}

window.onload = fadeOut;


function buy(id) {
            var m = document.f.num.value;
            document.f.action = "buy?id="+id+"&num="+m;
            document.f.submit();
        }
function render(id, pageindex, totalpage,gap)
{
   var container = document.getElementById(id);
   var content = "";
   if(pageindex > gap+1)
    content += "<a href='list?page=1'>First</a>";
   
   for(var i = pageindex - gap ; i<pageindex;i++)
   {
       if(i>0)
       content += "<a href='list?page="+i+"'>"+i+"</a>";
   }
   
   content += "<span>"+pageindex+"</span>";
   
   for(var i = pageindex +1 ; i<=pageindex+gap;i++)
   {
       if(i<=totalpage)
       content += "<a href='list?page="+i+"'>"+i+"</a>";
   }
   
   if(pageindex < totalpage - gap)
    content += "<a href='list?page="+totalpage+"'>Last</a>";
   container.innerHTML = content;
}
