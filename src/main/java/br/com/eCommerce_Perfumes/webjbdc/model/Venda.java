package br.com.eCommerce_Perfumes.webjbdc.model;

import java.util.Date;

public class Venda {
	
	private int id;
	private int clienteID;
	private Date dataVenda;
	private double totalVenda;
	private String observacoes;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public int getClienteID() {
		return clienteID;
	}
	public void setClienteID(int clienteID) {
		this.clienteID = clienteID;
	}
	
	public Date getDataVenda() {
		return dataVenda;
	}
	public void setDataVenda(Date dataVenda) {
		this.dataVenda = dataVenda;
	}
	
	public double getTotalVenda() {
		return totalVenda;
	}
	public void setTotalVenda(double totalVenda) {
		this.totalVenda = totalVenda;
	}
	
	public String getObservacoes() {
		return observacoes;
	}
	public void setObservacoes(String observacoes) {
		this.observacoes = observacoes;
	}
}