package com.project.models;
// Generated Nov 4, 2022, 7:41:33 AM by Hibernate Tools 4.3.6.Final

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * InvoiceImport generated by hbm2java
 */
@Entity
@Table(name = "invoice_import", catalog = "warehouse_management")
public class InvoiceImport implements java.io.Serializable {

	private Integer id;
	private Account account;
	private Supplier supplier;
	private Date created;
	private String payment;
	private String description;
	private Set<InvoiceImportDetails> invoiceImportDetailses = new HashSet<InvoiceImportDetails>(0);

	public InvoiceImport() {
	}

	public InvoiceImport(Account account, Supplier supplier, Date created, String payment) {
		this.account = account;
		this.supplier = supplier;
		this.created = created;
		this.payment = payment;
	}

	public InvoiceImport(Account account, Supplier supplier, Date created, String payment, String description,
			Set<InvoiceImportDetails> invoiceImportDetailses) {
		this.account = account;
		this.supplier = supplier;
		this.created = created;
		this.payment = payment;
		this.description = description;
		this.invoiceImportDetailses = invoiceImportDetailses;
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "account_id", nullable = false)
	public Account getAccount() {
		return this.account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "supplier_id", nullable = false)
	public Supplier getSupplier() {
		return this.supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "created", nullable = false, length = 10)
	public Date getCreated() {
		return this.created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	@Column(name = "payment", nullable = false, length = 250)
	public String getPayment() {
		return this.payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	@Column(name = "description", length = 250)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "invoiceImport")
	public Set<InvoiceImportDetails> getInvoiceImportDetailses() {
		return this.invoiceImportDetailses;
	}

	public void setInvoiceImportDetailses(Set<InvoiceImportDetails> invoiceImportDetailses) {
		this.invoiceImportDetailses = invoiceImportDetailses;
	}

}
