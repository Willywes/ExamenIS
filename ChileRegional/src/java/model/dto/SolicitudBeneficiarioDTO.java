/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dto;

/**
 *
 * @author Willywes
 */
public class SolicitudBeneficiarioDTO {
    
    private int solicitudId;
    private BeneficiarioDTO beneficiario;
    private int porcentaje;

    public SolicitudBeneficiarioDTO() {
    }

    public SolicitudBeneficiarioDTO(int solicitudId, BeneficiarioDTO beneficiario, int porcentaje) {
        this.solicitudId = solicitudId;
        this.beneficiario = beneficiario;
        this.porcentaje = porcentaje;
    }

    public int getSolicitudId() {
        return solicitudId;
    }

    public BeneficiarioDTO getBeneficiario() {
        return beneficiario;
    }

    public int getPorcentaje() {
        return porcentaje;
    }

    @Override
    public String toString() {
        return "SolicitudBeneficiarioDTO{" + "solicitud=" + solicitudId + ", beneficiario=" + beneficiario.toString() + ", porcentaje=" + porcentaje + '}';
    }
    
    
    
}
