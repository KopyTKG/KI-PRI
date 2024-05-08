const main = document.getElementById("app")
let size = 5
let count = 0

let col = document.createElement('div')
col.classList.add('col')
main.appendChild(col)

for(let c = 0; c < size; c++) {
	let row = document.createElement('div')
	row.classList.add('row')
	col.appendChild(row)

	for(let i = 0; i< size; i++) {
    		document.getElementById("count").innerHTML = count
    		let el = document.createElement("div")
   		el.classList.add("bg")
   	 	el.classList.add("size")
   	 	el.classList.add("box")
   	 	el.onclick = () => {
   	 	    el.classList.toggle('highlight')
   	 	    if(el.classList.contains("highlight")) count++
   	 	    else count--
   	 	    document.getElementById("count").innerHTML = count
   	 	}
   	 	row.appendChild(el)
	}
}
