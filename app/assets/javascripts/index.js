$.ready(console.log('hi from JQ'));

// const click = (e) => {
// 	console.log('clickly');
// };

// $.get('/observations/new', (data) => {
// 	console.log('yerr newww', data);
// });

const getGalaxies = () => {
	$.get('/galaxies', (indexGalaxies) => {
		for (const galaxyData of indexGalaxies) {
			const galaxy = new Galaxy(galaxyData);
			// for (const ob of galaxyData.observations) {
			// 	debugger;
			// 	const observation = new Observation(ob);
			// 	galaxy.observations.push(observation);
			// }
			for (const us of galaxyData.users) {
				const user = new User(us);
				galaxy.users.push(user);
			}
			debugger;
			console.log(galaxy);
		}
		// const ting = new Galaxy(e[0]);
		// $('#lol').append(`${ting.name} + ${ting.classification}`);
	});
};

const handleObservationAll = () => {
	const observationsHTML = ({ name, user, galaxy }) =>
		`<p>The name of this observation: <a href="#" class="ob">${name}</a></p>
     <p>The owner of this observation: <a href="#" class="ob">${user.username}</a></p>
     <p>The galaxy is: <a href="#" class="ob">${galaxy.name}</a></p>
	 </br>`;

	const generateObservationStr = (observations) => {
		let observationsStr = ``;
		for (const ob of observations) {
			const observation = new Observation(ob);
			observationsStr += observationsHTML(observation);
		}
		return observationsStr;
	};

	$.get('/observations.json', (e) => {
		$('#observations').html(generateObservationStr(e));
		///// fix this, stop going for all the events at the same time
		// $('.ob').each((idx, val) => {
		// 	$(this).on('click', () => {
		// 		console.log('click clik');
		// 	});
		// 	console.log(idx, val);
		// });
		////////////////////////////
	});
};
///////////////////////////////////

const renderUser = () => {
	const id = $('#user')[0].dataset.userid;
	$.get(`/users/${id}.json`, (e) => {
		const user = new User(e);
		$('#user').html(user.welcome());
	});
};

// PUT ALL ENDING FUNCTINS HERE

getGalaxies();

renderUser();
handleObservationAll();
