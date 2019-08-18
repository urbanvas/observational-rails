const generateObservationsandUsersforGalaxy = (data, object) => {
	for (const observation of data.observations) {
		const newObservation = new Observation(observation);
		object.observations.push(newObservation);
	}
	for (const user of data.users) {
		const newUser = new User(user);
		object.users.push(newUser);
	}
};

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
	$.get('/galaxies.json', (indexGalaxies) => {
		for (const galaxyData of indexGalaxies) {
			const galaxy = new Galaxy(galaxyData);
			generateObservationsandUsersforGalaxy(galaxyData, galaxy);
			$('#index').append(galaxy.generateGalaxyHTML());
		}
	});
};

const clickHandlers = () => {
	$('#new_observation').on('submit', function(e) {
		e.preventDefault();
		const serializedObservation = $(this).serialize();
		$.post('/observations', serializedObservation).done((observationData) => {
			const observation = new Observation(observationData);
			$(location).attr('href', `/observations/${observation.id}/galaxies/new`);
		});
	});

	$('#new_galaxy').on('submit', function(e) {
		e.preventDefault();
		const serializedGalaxy = $(this).serialize();
		$.post('/galaxies', serializedGalaxy).done((data) => {
			const galaxy = new Galaxy(data);
			generateObservationsandUsersforGalaxy(data, galaxy);
			$(location).attr('href', `/app`);
		});
	});
};

if ($(location).attr('pathname') === '/app') {
	renderUser();
}
clickHandlers();
