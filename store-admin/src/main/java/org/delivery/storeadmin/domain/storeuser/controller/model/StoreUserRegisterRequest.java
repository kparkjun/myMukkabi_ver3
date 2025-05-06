package org.delivery.storeadmin.domain.storeuser.controller.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.delivery.db.storeuser.enums.StoreUserRole;

import javax.persistence.Column;
import javax.validation.constraints.NotBlank;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StoreUserRegisterRequest {


    private Long storeId;

    @JsonProperty("storeName")
    @NotBlank
    private String storeName;

    @NotBlank
    private String email;

    @NotBlank
    private String password;


    private StoreUserRole role;
}