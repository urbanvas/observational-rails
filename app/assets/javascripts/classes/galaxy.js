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
			string += `<li class="button is-info is-outlined" data-observationId="${ob.id}" onClick="getIndividualObservation(${ob.id})">${ob.name}</li>`;
		});
		return string;
	}

	generateGalaxyUsers() {
		let string = '';
		const listElements = this.users.map((user) => {
			return `<li class="button is-danger is-outlined" data-userId="${user.id}" onClick="getIndividualUser(${user.id})">${user.username}</li>`;
		});
		[ ...new Set(listElements) ].forEach((el) => {
			string += el;
		});
		return string;
	}

	generateGalaxyHTML() {
		return `<div class="block" data-galaxyId=${this.id}">
					<article class="message is-primary">
						<div class="message-header">
							<h3>${this.name}</h3>
						</div>
						<div class="message-body">
						<p class="menu-label">This galaxy is classified as ${this.classification} and its color is ${this
			.color}, currently it ${this.life ? 'does support' : 'does not support'} life.</p>
						<p>Other Observations that have seen this galaxy are:</p>
						<ul class="menu-list">
						${this.generateGalaxyObservations()}
						</ul>
						<p class="menu-label"> Other Users that have seen this galaxy are:</p>
						<ul class="menu-list">
						${this.generateGalaxyUsers()}
						</ul>
						</div>
					</article>
				</div>
				</br>`;
	}
}
