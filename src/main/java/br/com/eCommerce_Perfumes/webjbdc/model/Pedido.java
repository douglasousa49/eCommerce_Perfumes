package br.com.eCommerce_Perfumes.webjbdc.model;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

public class Pedido {
    private int usuarioId;
    private BigDecimal totalVenda;
    private LocalDateTime dataVenda;
    private String observacoes;
    private List<ProdutoItem> items;

    // Getters e Setters
    public int getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(int usuarioId) {
        this.usuarioId = usuarioId;
    }

    public BigDecimal getTotalVenda() {
        return totalVenda;
    }

    public void setTotalVenda(BigDecimal totalVenda) {
        this.totalVenda = totalVenda;
    }

    public LocalDateTime getDataVenda() {
        return dataVenda;
    }

    public void setDataVenda(LocalDateTime dataVenda) {
        this.dataVenda = dataVenda;
    }

    public String getObservacoes() {
        return observacoes;
    }

    public void setObservacoes(String observacoes) {
        this.observacoes = observacoes;
    }

    public List<ProdutoItem> getItems() {
        return items;
    }

    public void setItems(List<ProdutoItem> items) {
        this.items = items;
    }
}