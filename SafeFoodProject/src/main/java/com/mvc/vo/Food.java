package com.mvc.vo;

public class Food {
	private String id, name, ingredient, maker, img;

	protected String supportpereat;
	protected String calory;
	protected String carbo;
	protected String protein;
	protected String fat;
	protected String sugar;
	protected String natrium;
	protected String chole;
	protected String fattyacid;
	protected String transfat;
	
	public Food(String id, String name, String ingredient, String maker, String img, String supportpereat,
			String calory, String carbo, String protein, String fat, String sugar, String natrium, String chole,
			String fattyacid, String transfat) {
		this.id = id;
		this.name = name;
		this.ingredient = ingredient;
		this.maker = maker;
		this.img = img;
		this.supportpereat = supportpereat;
		this.calory = calory;
		this.carbo = carbo;
		this.protein = protein;
		this.fat = fat;
		this.sugar = sugar;
		this.natrium = natrium;
		this.chole = chole;
		this.fattyacid = fattyacid;
		this.transfat = transfat;
	}

	public Food(String id, String name, String ingredient, String maker, String img) {
		super();
		this.id = id;
		this.name = name;
		this.ingredient = ingredient;
		this.maker = maker;
		this.img = img;
	}

	public Food() {}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIngredient() {
		return ingredient;
	}

	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}

	public String getMaker() {
		return maker;
	}

	public void setMaker(String maker) {
		this.maker = maker;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getSupportpereat() {
		return supportpereat;
	}

	public void setSupportpereat(String supportpereat) {
		this.supportpereat = supportpereat;
	}

	public String getCalory() {
		return calory;
	}

	public void setCalory(String calory) {
		this.calory = calory;
	}

	public String getCarbo() {
		return carbo;
	}

	public void setCarbo(String carbo) {
		this.carbo = carbo;
	}

	public String getProtein() {
		return protein;
	}

	public void setProtein(String protein) {
		this.protein = protein;
	}

	public String getFat() {
		return fat;
	}

	public void setFat(String fat) {
		this.fat = fat;
	}

	public String getSugar() {
		return sugar;
	}

	public void setSugar(String sugar) {
		this.sugar = sugar;
	}

	public String getNatrium() {
		return natrium;
	}

	public void setNatrium(String natrium) {
		this.natrium = natrium;
	}

	public String getChole() {
		return chole;
	}

	public void setChole(String chole) {
		this.chole = chole;
	}

	public String getFattyacid() {
		return fattyacid;
	}

	public void setFattyacid(String fattyacid) {
		this.fattyacid = fattyacid;
	}

	public String getTransfat() {
		return transfat;
	}

	public void setTransfat(String transfat) {
		this.transfat = transfat;
	}

	@Override
	public String toString() {
		return "Food [id=" + id + ", name=" + name + ", ingredient=" + ingredient + ", maker=" + maker + ", img=" + img
				+ ", supportpereat=" + supportpereat + ", calory=" + calory + ", carbo=" + carbo + ", protein="
				+ protein + ", fat=" + fat + ", sugar=" + sugar + ", natrium=" + natrium + ", chole=" + chole
				+ ", fattyacid=" + fattyacid + ", transfat=" + transfat + "]";
	}
	
}