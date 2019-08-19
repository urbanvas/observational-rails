class User {
	constructor({ id, username, email }) {
		this.id = id;
		this.username = username;
		this.email = email;
		this.galaxies = [];
		this.observations = [];
	}

	welcome() {
		return `<h3 class="subtitle is-4">Hello, ${this.username}</h3>I hope all is well today.`;
	}

	generateName() {
		return `<div class="notification is-danger">
					<p>The name of this user is ${this.username}</p>
				</div>`;
	}
}
