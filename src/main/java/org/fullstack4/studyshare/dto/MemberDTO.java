package org.fullstack4.studyshare.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.apache.logging.log4j.core.config.plugins.validation.constraints.NotBlank;

import javax.validation.constraints.Min;
import javax.validation.constraints.Past;
import javax.validation.constraints.PositiveOrZero;
import javax.validation.constraints.Size;
import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberDTO {
    private int idx;
    private String user_id;
    private String name;
    private String pwd;
    private String phone;
    private String email;
    private LocalDate reg_date;
    private LocalDate login_date;
    private String lock_yn;
    private String limit_yn;

    private String phone_0;
    private String phone_1;
    private String phone_2;

    private String email_id;
    private String email_domain;

    public String getPhone_0(String phone) {return phone.substring(0, 2);}
    public String getPhone_1(String phone) {
        if (phone.length() == 10) {
            return phone.substring(phone.indexOf("-") + 1, phone.indexOf("-") + 3);
        } else {
            return phone.substring(phone.indexOf("-") + 1, phone.indexOf("-") + 4);
        }
    }
    public String getPhone_2(String phone) {
        return phone.substring(phone.lastIndexOf("-"));
    }
    public void setPhone(String phone_0, String phone_1, String phone_2) {
        this.phone = phone_0 + "-" + phone_1 + "-" + phone_2;
    }

    public String getEmail_id(String email) {
        return email.split("@")[0];
    }
    public String getEmail_domain(String email) {
        return email.split("@")[1];
    }
    public void setEmail(String email_id, String email_domain) {
        this.email = email_id + "@" + email_domain;
    }

}
