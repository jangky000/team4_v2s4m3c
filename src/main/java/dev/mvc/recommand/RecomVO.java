package dev.mvc.recommand;

public class RecomVO {
  /** ��õ ��Ʈ ��ȣ **/
  private int recomno;
  /** ���� ī�װ� ��ȣ **/
  private int grpno;
  /** ��ǰ ��� ��ȣ **/
  private int itemno;
  /** �Ǻ�Ÿ�� ��� **/
  private String testresult_type;
  /** ����� ȭ��ǰ��õ **/
  private String testresult_recom;
  /** ��õ ��Ʈ ���� **/
  private int recom_price;
  
  public RecomVO() {
    
  }
  
  public int getRecomno() {
    return recomno;
  }
  public void setRecomno(int recomno) {
    this.recomno = recomno;
  }
  public int getGrpno() {
    return grpno;
  }
  public void setGrpno(int grpno) {
    this.grpno = grpno;
  }
  public int getItemno() {
    return itemno;
  }
  public void setItemno(int itemno) {
    this.itemno = itemno;
  }
  public String getTestresult_type() {
    return testresult_type;
  }
  public void setTestresult_type(String testresult_type) {
    this.testresult_type = testresult_type;
  }
  public String getTestresult_recom() {
    return testresult_recom;
  }
  public void setTestresult_recom(String testresult_recom) {
    this.testresult_recom = testresult_recom;
  }
  public int getRecom_price() {
    return recom_price;
  }
  public void setRecom_price(int recom_price) {
    this.recom_price = recom_price;
  }
}
