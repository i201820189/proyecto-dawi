package net.farmacia.entidad;

public class FormatoRAI {
	
	private int codigo;
	private String descip;
	private String fuentes;
	private String contenido;
	private int codPlanT;
	private int codUsr;
	//Consulta
	private String area;
	private String apellidos;
	
	private int codigoPlan;
	
	public int getCodigoPlan() {
		return codigoPlan;
	}
	public void setCodigoPlan(int codigoPlan) {
		this.codigoPlan = codigoPlan;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getApellidos() {
		return apellidos;
	}
	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public String getDescip() {
		return descip;
	}
	public void setDescip(String descip) {
		this.descip = descip;
	}
	public String getFuentes() {
		return fuentes;
	}
	public void setFuentes(String fuentes) {
		this.fuentes = fuentes;
	}
	public String getContenido() {
		return contenido;
	}
	public void setContenido(String contenido) {
		this.contenido = contenido;
	}
	public int getCodPlanT() {
		return codPlanT;
	}
	public void setCodPlanT(int codPlanT) {
		this.codPlanT = codPlanT;
	}
	public int getCodUsr() {
		return codUsr;
	}
	public void setCodUsr(int codUsr) {
		this.codUsr = codUsr;
	}

}
