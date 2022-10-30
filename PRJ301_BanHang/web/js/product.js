$(document).ready(function () {
    $(".pricee").click(function () {
        let cid1 = $("#f1").attr("data-cid");
        let bid1 = $("#f1").attr("data-bid");
        let price1 = $(this).val();
        window.location.href = `Product?cid=${cid1}&bid=${bid1}&price=${price1}`;
    });
});
 function render(id, pageindex, totalpage, gap)
        {
            var container = document.getElementById(id);
            var content = "";
            if (pageindex > gap + 1)
                content += "<a href='Product?page=1'>First</a>";

            for (var i = pageindex - gap; i < pageindex; i++)
            {
                if (i > 0)
                    content += "<a href='Product?page=" + i + "'>" + i + "</a>";
            }

            content += "<span>" + pageindex + "</span>";

            for (var i = pageindex + 1; i <= pageindex + gap; i++)
            {
                if (i <= totalpage)
                    content += "<a href='Product?page=" + i + "'>" + i + "</a>";
            }

            if (pageindex < totalpage - gap)
                content += "<a href='Product?page=" + totalpage + "'>Last</a>";
            container.innerHTML = content;
        }