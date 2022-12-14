function displayRecords(page) {
    var allPages = document.getElementsByClassName("page-item active");
    for (let i = 0; i < allPages.length; i++) {
        allPages[i].className = allPages[i].className.replace(" active", "");
    }
    $(page).parent().addClass("active");
    var pagenumber = parseInt(page.innerText);
    currentPage = pagenumber;
    console.log("currentPage : " + currentPage);
    checkPreviousNextPage();
    fetchrecords(caller, currentPage);
}

function displayNextPage() {
    currentPage = currentPage + 1;
    console.log("currentPage : " + currentPage);
    var allPages = document.getElementsByClassName("page-item active");
    for (let i = 0; i < allPages.length; i++) {
        allPages[i].className = allPages[i].className.replace(" active", "");
    }
    var allPages = document.getElementsByClassName("page-item");
    for (let i = 0; i < allPages.length; i++) {
        if (allPages[i].innerText == currentPage) {
            allPages[i].className = "page-item active";
            break;
        }
    }
    checkPreviousNextPage();
    fetchrecords(caller, currentPage);
}

function displayPreviousPage() {
    currentPage = currentPage - 1;
    console.log("currentPage : " + currentPage);
    var allPages = document.getElementsByClassName("page-item active");
    for (let i = 0; i < allPages.length; i++) {
        allPages[i].className = allPages[i].className.replace(" active", "");
    }
    var allPages = document.getElementsByClassName("page-item");
    for (let i = 0; i < allPages.length; i++) {
        if (allPages[i].innerText == currentPage) {
            allPages[i].className = "page-item active";
            break;
        }
    }
    checkPreviousNextPage();
    fetchrecords(caller, currentPage);
}

function checkPreviousNextPage() {
	if(numberOfPagesRequired <= 1){
		$(".pagination").css('display','none');
	}else if (currentPage == numberOfPagesRequired) {
		$(".pagination").css('display','');
        $("#previous").removeClass("disabled");
        $("#next").addClass("disabled");
	} else if (currentPage == 1) {
		$(".pagination").css('display','');
        $("#previous").addClass("disabled");
        $("#next").removeClass("disabled"); 
    } else {
		$(".pagination").css('display','');
        $("#previous").removeClass("disabled");
        $("#next").removeClass("disabled");
    }
}