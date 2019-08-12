$.ready(console.log('hi from JQ'));

const getGalaxies = () => {
	$.get('/galaxies', (e) => {
		const ting = new Galaxy(e[0]);
		console.log(ting);
		$('#lol').append(`${ting.name} + ${ting.classification}`);
	});
};

const getUser = () => {
	$.get('/users/1', (e) => {
		const lol = new User(e);
		console.log(lol);
		console.log(lol.hi());
	});
};
