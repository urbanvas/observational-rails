class Observation {
	constructor({ id, name, user_id, galaxy_id }) {
		this.id = id;
		this.name = name;
		this.user_id = user_id;
		this.galaxy_id = galaxy_id;
	}

	generateName() {
		return `<div class="block">
					<article class="message is-info">
						<div class="message-header">
							<p>The name of this observation is ${this.name}</p>
						</div>
					</article>
				</div>`;
	}
}
