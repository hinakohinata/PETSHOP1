package com.fpltn.entities;
// Generated Apr 25, 2023, 2:09:08 PM by Hibernate Tools 4.3.6.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * User generated by hbm2java
 */
@Entity
@Table(name = "user", catalog = "dbbh", uniqueConstraints = @UniqueConstraint(columnNames = "username"))
public class User implements java.io.Serializable {

	private Integer id;
	private String username;
	private String password;
	private String fullname;
	private String email;
	private String ghichu;
	private String userrole;
	private Set<Cartlist> cartlists = new HashSet<Cartlist>(0);

	public User() {
	}

	public User(String username, String password, String fullname, String email, String ghichu, String userrole,
			Set<Cartlist> cartlists) {
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.email = email;
		this.ghichu = ghichu;
		this.userrole = userrole;
		this.cartlists = cartlists;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "username", unique = true, length = 45)
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "password", length = 70)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "fullname", length = 45)
	public String getFullname() {
		return this.fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	@Column(name = "email", length = 50)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "ghichu", length = 45)
	public String getGhichu() {
		return this.ghichu;
	}

	public void setGhichu(String ghichu) {
		this.ghichu = ghichu;
	}

	@Column(name = "userrole", length = 45)
	public String getUserrole() {
		return this.userrole;
	}

	public void setUserrole(String userrole) {
		this.userrole = userrole;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	public Set<Cartlist> getCartlists() {
		return this.cartlists;
	}

	public void setCartlists(Set<Cartlist> cartlists) {
		this.cartlists = cartlists;
	}

}
