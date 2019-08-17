class Galaxy {
	constructor({ id, name, classification, color, life }) {
		this.id = id;
		this.name = name;
		this.life = life;
		this.classification = classification;
		this.color = color;
		this.observations = [];
		this.users = [];
	}

	generateGalaxyObservations() {
		let string = '';
		this.observations.forEach((ob) => {
			string += `<li class="list">
				<a href="#" data-observationId="${ob.id}" onClick="getIndividualObservation(${ob.id})">${ob.name}</a>
				</li>`;
		});
		return string;
	}

	generateGalaxyUsers() {
		let string = '';
		const listElements = this.users.map((user) => {
			return `<li class="list">
			<a href="#" data-userId="${user.id}" onClick="getIndividualUser(${user.id})">${user.username}</a>
			</li>`;
		});
		[ ...new Set(listElements) ].forEach((el) => {
			string += el;
		});
		return string;
	}

	generateGalaxyHTML() {
		return `<div id="galaxy-${this.id} data-galaxyId=${this.id}">
		<h3>${this.name}</h3>
		<p>This galaxy is classified as ${this.classification} and its color is ${this.color}, currently it ${this.life
			? 'does support'
			: 'does not support'} life.</p>
		<p>Other Observations that have seen this galaxy are:</p>
		<ul>
			${this.generateGalaxyObservations()}
		</ul>
		<p> Other Users that have seen this galaxy are:</p>
		<ul>
			${this.generateGalaxyUsers()}
		</ul>
	</div>`;
	}
}
