package com.mybatis.vo;

public class Emp {
	String id;
	String name;
	String mailid;
	String start_date;
	String title;
	String dept_id;
	String salary;
	String commision_pct;

	public Emp(String id, String name, String mailid, String start_date, String title, String dept_id, String salary,
			String commision_pct) {
		super();
		this.id = id;
		this.name = name;
		this.mailid = mailid;
		this.start_date = start_date;
		this.title = title;
		this.dept_id = dept_id;
		this.salary = salary;
		this.commision_pct = commision_pct;
	}

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

	public String getMailid() {
		return mailid;
	}

	public void setMailid(String mailid) {
		this.mailid = mailid;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDept_id() {
		return dept_id;
	}

	public void setDept_id(String dept_id) {
		this.dept_id = dept_id;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getCommision_pct() {
		return commision_pct;
	}

	public void setCommision_pct(String commision_pct) {
		this.commision_pct = commision_pct;
	}
}