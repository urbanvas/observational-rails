const renderUser = () => {
	const id = $('#user')[0].dataset.userid;
	$.get(`/users/${id}.json`, (e) => {
		const user = new User(e);
		$('#user').html(user.welcome());
	});
};

const getIndividualObservation = (id) => {
	$.get(`/observations/${id}.json`, (ob) => {
		const newObservation = new Observation(ob);
		$('#show').html(newObservation.generateName());
	});
};

const getIndividualUser = (id) => {
	$.get(`/users/${id}.json`, (user) => {
		const newUser = new User(user);
		$('#show').html(newUser.generateName());
	});
};

const getGalaxies = () => {
	$('#index').empty();
	$.get('/galaxies', (indexGalaxies) => {
		for (const galaxyData of indexGalaxies) {
			const galaxy = new Galaxy(galaxyData);
			for (const observation of galaxyData.observations) {
				const newObservation = new Observation(observation);
				galaxy.observations.push(newObservation);
			}
			for (const user of galaxyData.users) {
				const newUser = new User(user);
				galaxy.users.push(newUser);
			}
			$('#index').append(galaxy.generateGalaxyHTML());
		}
	});
};

// const handleObservationAll = () => {
// 	const observationsHTML = ({ name, user, galaxy }) =>
// 		`<p>The name of this observation: <a href="#" class="ob">${name}</a></p>
//      <p>The owner of this observation: <a href="#" class="ob">${user.username}</a></p>
//      <p>The galaxy is: <a href="#" class="ob">${galaxy.name}</a></p>
// 	 </br>`;

// 	const generateObservationStr = (observations) => {
// 		let observationsStr = ``;
// 		for (const ob of observations) {
// 			const observation = new Observation(ob);
// 			observationsStr += observationsHTML(observation);
// 		}
// 		return observationsStr;
// 	};

// 	$.get('/observations.json', (e) => {
// 		$('#observations').html(generateObservationStr(e));
// 		///// fix this, stop going for all the events at the same time
// 		// $('.ob').each((idx, val) => {
// 		// 	$(this).on('click', () => {
// 		// 		console.log('click clik');
// 		// 	});
// 		// 	console.log(idx, val);
// 		// });
// 		////////////////////////////
// 	});
// };
if ($(location).attr('pathname') === '/app') {
	renderUser();
}
// handleObservationAll();
