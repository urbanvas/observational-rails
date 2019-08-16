const getGalaxies = () => {
	$('#index').html = '';
	const generateGalaxyHTML = ({ id, name, classification, color, life, observations, users }) => {
		const generateObservationList = (allObservations) => {
			let string = '';
			allObservations.forEach((ob) => {
				string += `<li class="list" data-observationId="${ob.id}">${ob.name}</li>`;
			});
			return string;
		};
		const generateUserList = (allUsers) => {
			let string = '';
			const listElements = allUsers.map((user) => {
				return `<li class="list" data-userId="${user.id}">${user.username}</li>`;
			});
			[ ...new Set(listElements) ].forEach((el) => {
				string += el;
			});
			return string;
		};
		return `<div id="galaxy-${id} data-galaxyId=${id}">
			<h3>${name}</h3>
			<p>This galaxy belongs to ${classification} and its color is ${color}, current it ${life
			? 'does support'
			: 'does not support'} life.</p>
			<p>Other Observations that have seen this galaxy are:</p>
			<ul>
				${generateObservationList(observations)}
			</ul>
			<p> Other Users that have seen this galaxy are:</p>
			<ul>
				${generateUserList(users)}
			</ul>
		</div>`;
	};
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
			$('#index').append(generateGalaxyHTML(galaxy));
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
///////////////////////////////////

const renderUser = () => {
	const id = $('#user')[0].dataset.userid;
	$.get(`/users/${id}.json`, (e) => {
		const user = new User(e);
		$('#user').html(user.welcome());
	});
};

// PUT ALL ENDING FUNCTINS HERE

renderUser();
// handleObservationAll();
