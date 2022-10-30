// add hovered class to selected list item
let list = document.querySelectorAll(".navigation li");

function activeLink() {
  list.forEach((item) => {
    item.classList.remove("hovered");
  });
  this.classList.add("hovered");
}

list.forEach((item) => item.addEventListener("mouseover", activeLink));

// Menu Toggle
let toggle = document.querySelector(".toggle");
let navigation = document.querySelector(".navigation");
let main = document.querySelector(".main");

toggle.onclick = function () {
  navigation.classList.toggle("active");
  main.classList.toggle("active");
};
function render(id, pageindex, totalpage, gap)
{
    var container = document.getElementById(id);
    var content = "";
    if (pageindex > gap + 1)
        content += "<a href='Admin?page=1'>First</a>";

    for (var i = pageindex - gap; i < pageindex; i++)
    {
        if (i > 0)
            content += "<a href='Admin?page=" + i + "'>" + i + "</a>";
    }

    content += "<a >" + pageindex + "</a>";

    for (var i = pageindex + 1; i <= pageindex + gap; i++)
    {
        if (i <= totalpage)
            content += "<a href='Admin?page=" + i + "'>" + i + "</a>";
    }

    if (pageindex < totalpage - gap)
        content += "<a href='Admin?page=" + totalpage + "'>Last</a>";
    container.innerHTML = content;
}

