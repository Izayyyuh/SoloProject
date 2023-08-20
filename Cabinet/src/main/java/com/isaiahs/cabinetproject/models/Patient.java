package com.isaiahs.cabinetproject.models;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Past;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="patients")
public class Patient {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	 private Long id;
	
	@NotBlank(message="First Name is required!")
    @Size(min=3, max=30, message="First name must be between 3 and 30 characters")
    private String patientFirstName;
   
    @NotBlank(message="Last Name is required!")
    @Size(min=3, max=30, message="Last name must be between 3 and 30 characters")
    private String patientLastName;
    
    @NotNull
    private int medicalRecordsNumber;
    
    @NotNull
    @Min(value=1, message="Room number must be greater than 0")
    @Max(value=50, message="Room number must be less than 50")
    private Integer roomNumber;
    
    @NotBlank(message="Problem is required!")
    @Size(min=5, max=150, message="Problem must be between 5 and 150 characters")
    private String patientProblem;
    
    @NotBlank
    private String patientType;
    
    @NotNull(message="Date of Birth required!")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @Past
    private Date dateOfBirth;
    
    @NotEmpty(message="Medical history entry must not be blank")
    private ArrayList<String> medicalHistory=new ArrayList<String>();
    
    @Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    @PrePersist // runs the method right before the object is created
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate //runs a method when the object is modified
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
    
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="creator_id")
    private User creator;
    
    @OneToMany(mappedBy="patient", fetch=FetchType.LAZY)
    private List<EmergencyContact> emergencyContact;

	public Patient() {}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPatientFirstName() {
		return patientFirstName;
	}

	public void setPatientFirstName(String patientFirstName) {
		this.patientFirstName = patientFirstName;
	}

	public String getPatientLastName() {
		return patientLastName;
	}

	public void setPatientLastName(String patientLastName) {
		this.patientLastName = patientLastName;
	}

	public Integer getMedicalRecordsNumber() {
		return medicalRecordsNumber;
	}

	public void setMedicalRecordsNumber(Integer medicalRecordsNumber) {
		this.medicalRecordsNumber = medicalRecordsNumber;
	}

	public Integer getRoomNumber() {
		return roomNumber;
	}

	public void setRoomNumber(Integer roomNumber) {
		this.roomNumber = roomNumber;
	}

	public String getPatientProblem() {
		return patientProblem;
	}

	public void setPatientProblem(String patientProblem) {
		this.patientProblem = patientProblem;
	}

	public String getPatientType() {
		return patientType;
	}

	public void setPatientType(String patientType) {
		this.patientType = patientType;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public ArrayList<String> getMedicalHistory() {
		return medicalHistory;
	}

	public void setMedicalHistory(ArrayList<String> medicalHistory) {
		this.medicalHistory = medicalHistory;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public User getCreator() {
		return creator;
	}

	public void setCreator(User creator) {
		this.creator = creator;
	}
	public List<EmergencyContact> getEmergencyContact() {
		return emergencyContact;
	}
	public void setEmergencyContact(List<EmergencyContact> emergencyContact) {
		this.emergencyContact = emergencyContact;
	}
	
    
}
