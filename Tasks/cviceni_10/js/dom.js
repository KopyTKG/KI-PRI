let ctiKnihy = (xmlDoc) => {
  const divKnihy = document.getElementById('knihy')
  const knihy = xmlDoc.getElementsByTagName('kniha')

  const table = appendCreate(divKnihy, 'table')
  
  const thead = appendCreate(table, 'thead')
  const tr = appendCreate(thead, 'tr')
  let cols = ['Název', 'Autor']
  cols.forEach(col => {
   let tmp = appendCreate(tr, 'th')
   tmp.innerHTML = col
  })

  const tbody = appendCreate(table, 'tbody')
  for (let kniha of knihy) {
	let tr = appendCreate(tbody, 'tr')
	let nazev = appendCreate(tr, 'td')
	nazev.innerHTML = kniha.getElementsByTagName('nazev')[0].innerHTML
	let autor = appendCreate(tr, 'td')
	autor.innerHTML = kniha.getElementsByTagName('autor')[0].innerHTML
	
	tr.addEventListener('click', () => {
		tr.classList.toggle('selected')
	})
  }
}

// helper function
let appendCreate = (parent, tag) => {
  let elem = document.createElement(tag)
  parent.appendChild(elem)
  return elem
}

// obsluha globální DOM události
let toggleBackground = () => document.body.classList.toggle('dark')
window.addEventListener('keydown', toggleBackground)

let processDOM = ctiKnihy
