package model;

import java.sql.Time;
import java.sql.Date;

public class Reservation {
	private int id;
	private Date date;
	private Time heureDebut;
	private Time heureFin;
	private int utilisateurId;
	private int salleId;
	private String statut;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Time getHeureDebut() {
		return heureDebut;
	}
	public void setHeureDebut(Time heureDebut) {
		this.heureDebut = heureDebut;
	}
	public Time getHeureFin() {
		return heureFin;
	}
	public void setHeureFin(Time heureFin) {
		this.heureFin = heureFin;
	}
	public int getUtilisateurId() {
		return utilisateurId;
	}
	public void setUtilisateurId(int utilisateurId) {
		this.utilisateurId = utilisateurId;
	}
	public int getSalleId() {
		return salleId;
	}
	public void setSalleId(int salleId) {
		this.salleId = salleId;
	}
	public String getStatut() {
		return statut;
	}
	public void setStatut(String statut) {
		this.statut = statut;
	}
	
	
	
}
