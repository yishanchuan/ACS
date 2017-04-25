package com.web.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Test {

	@Id
	private int id;
	private int name;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getName() {
		return name;
	}
	public void setName(int name) {
		this.name = name;
	}
	
}
