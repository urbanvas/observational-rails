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
}
