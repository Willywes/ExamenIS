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
public class ContratoBeneficiarioDTO {
    
    private int contratoId;
    private BeneficiarioDTO beneficiario;
    private int porcentaje;
    
    public ContratoBeneficiarioDTO(){
        
    }

    public ContratoBeneficiarioDTO(int contratoId, BeneficiarioDTO beneficiario, int porcentaje) {
        this.contratoId = contratoId;
        this.beneficiario = beneficiario;
        this.porcentaje = porcentaje;
    }

    public int getContratoId() {
        return contratoId;
    }

    public BeneficiarioDTO getBeneficiario() {
        return beneficiario;
    }

    public int getPorcentaje() {
        return porcentaje;
    }

    @Override
    public String toString() {
        return "ContratoBeneficiarioDTO{" + "contrato=" + contratoId + ", beneficiario=" + beneficiario.toString() + ", porcentaje=" + porcentaje + '}';
    }
    
    
    
}
