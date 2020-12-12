package main.java.net.adatb2.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.*;

@Entity
@Table(name = "`product`", schema = "DB_ADMIN")
public class Product {
	@Id
	@Column(name = "`id`")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "idGenerator")
	@SequenceGenerator(name = "idGenerator", sequenceName = "USERSEQ", allocationSize = 1)
	private Long id;
	@Column(name = "`name`")
	private String name;
	@Column(name = "`brand`")
	private String brand;
	@Column(name = "`madein`")
	private String madein;
	@Column(name = "`price`")
	private int price;

	public Product() {
	}

	protected Product(Long id, String name, String brand, String madein, int price) {
		super();
		this.id = id;
		this.name = name;
		this.brand = brand;
		this.madein = madein;
		this.price = price;
	}

	//@Id
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getMadein() {
		return madein;
	}

	public void setMadein(String madein) {
		this.madein = madein;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

}
