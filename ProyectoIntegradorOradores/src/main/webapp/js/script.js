function EliminarTicket(){
	window.location="delete.jsp";
	//window.open("delete.jsp")
}

const btnDell = document.getElementById("btnDelete");

btnDell.addEventListener("click",EliminarTicket);