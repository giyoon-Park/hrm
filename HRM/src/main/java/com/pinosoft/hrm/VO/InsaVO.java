package com.pinosoft.hrm.VO;

/**
 * 
 * @author	박기윤
 * @since	2020.07.29
 * @version	v.1.0
 *
 */

import org.apache.ibatis.type.*;
import org.springframework.web.multipart.*;
import java.sql.*;

@Alias("insa")
public class InsaVO {
	private int sabun, years, salary;
	private String put_yn, name, reg_no, phone, hp, carrier, pos_gbn_code, sex, email, zip, addr1, addr2, dept_code, join_gbn_code,
					id, pwd, kosa_reg_yn, kosa_gbn_code, mil_yn, mil_type, mil_level, job_type, gart_level, self_intro, crm_name, profile, join_yn;
	private Date join_day, retire_day, mil_startdate, mil_enddate;
	private MultipartFile file;
	
	public int getSabun() {
		return sabun;
	}
	public void setSabun(int sabun) {
		this.sabun = sabun;
	}
	public int getYears() {
		return years;
	}
	public void setYears(int years) {
		this.years = years;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public String getPut_yn() {
		return put_yn;
	}
	public void setPut_yn(String put_yn) {
		this.put_yn = put_yn;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getReg_no() {
		return reg_no;
	}
	public void setReg_no(String reg_no) {
		this.reg_no = reg_no;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getCarrier() {
		return carrier;
	}
	public void setCarrier(String carrier) {
		this.carrier = carrier;
	}
	public String getPos_gbn_code() {
		return pos_gbn_code;
	}
	public void setPos_gbn_code(String pos_gbn_code) {
		this.pos_gbn_code = pos_gbn_code;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getDept_code() {
		return dept_code;
	}
	public void setDept_code(String dept_code) {
		this.dept_code = dept_code;
	}
	public String getJoin_gbn_code() {
		return join_gbn_code;
	}
	public void setJoin_gbn_code(String join_gbn_code) {
		this.join_gbn_code = join_gbn_code;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getKosa_reg_yn() {
		return kosa_reg_yn;
	}
	public void setKosa_reg_yn(String kosa_reg_yn) {
		this.kosa_reg_yn = kosa_reg_yn;
	}
	public String getKosa_gbn_code() {
		return kosa_gbn_code;
	}
	public void setKosa_gbn_code(String kosa_gbn_code) {
		this.kosa_gbn_code = kosa_gbn_code;
	}
	public String getMil_yn() {
		return mil_yn;
	}
	public void setMil_yn(String mil_yn) {
		this.mil_yn = mil_yn;
	}
	public String getMil_type() {
		return mil_type;
	}
	public void setMil_type(String mil_type) {
		this.mil_type = mil_type;
	}
	public String getMil_level() {
		return mil_level;
	}
	public void setMil_level(String mil_level) {
		this.mil_level = mil_level;
	}
	public String getJob_type() {
		return job_type;
	}
	public void setJob_type(String job_type) {
		this.job_type = job_type;
	}
	public String getGart_level() {
		return gart_level;
	}
	public void setGart_level(String gart_level) {
		this.gart_level = gart_level;
	}
	public String getSelf_intro() {
		return self_intro;
	}
	public void setSelf_intro(String self_intro) {
		this.self_intro = self_intro;
	}
	public String getCrm_name() {
		return crm_name;
	}
	public void setCrm_name(String crm_name) {
		this.crm_name = crm_name;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public Date getJoin_day() {
		return join_day;
	}
	public void setJoin_day(Date join_day) {
		this.join_day = join_day;
	}
	public Date getRetire_day() {
		return retire_day;
	}
	public void setRetire_day(Date retire_day) {
		this.retire_day = retire_day;
	}
	public Date getMil_startdate() {
		return mil_startdate;
	}
	public void setMil_startdate(Date mil_startdate) {
		this.mil_startdate = mil_startdate;
	}
	public Date getMil_enddate() {
		return mil_enddate;
	}
	public void setMil_enddate(Date mil_enddate) {
		this.mil_enddate = mil_enddate;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getJoin_yn() {
		return join_yn;
	}
	public void setJoin_yn(String join_yn) {
		this.join_yn = join_yn;
	}
	@Override
	public String toString() {
		return "InsaVO [sabun=" + sabun + ", years=" + years + ", salary=" + salary + ", put_yn=" + put_yn + ", name="
				+ name + ", reg_no=" + reg_no + ", phone=" + phone + ", hp=" + hp + ", carrier=" + carrier
				+ ", pos_gbn_code=" + pos_gbn_code + ", sex=" + sex + ", email=" + email + ", zip=" + zip + ", addr1="
				+ addr1 + ", addr2=" + addr2 + ", dept_code=" + dept_code + ", join_gbn_code=" + join_gbn_code + ", id="
				+ id + ", pwd=" + pwd + ", kosa_reg_yn=" + kosa_reg_yn + ", kosa_gbn_code=" + kosa_gbn_code
				+ ", mil_yn=" + mil_yn + ", mil_type=" + mil_type + ", mil_level=" + mil_level + ", job_type="
				+ job_type + ", gart_level=" + gart_level + ", self_intro=" + self_intro + ", crm_name=" + crm_name
				+ ", profile=" + profile + ", join_yn=" + join_yn + ", join_day=" + join_day + ", retire_day="
				+ retire_day + ", mil_startdate=" + mil_startdate + ", mil_enddate=" + mil_enddate + ", file=" + file
				+ "]";
	}
}
