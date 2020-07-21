package dev.mvc.recommand;

public class RecomVO {
  /** 추천 세트 번호 **/
  private int recomno;
  /** 메인 카테고리 번호 **/
  private int grpno;
  /** 상품 등록 번호 **/
  private int itemno;
  /** 피부타입 결과 **/
  private String testresult_type;
  /** 결과별 화장품추천 **/
  private String testresult_recom;
  /** 추천 세트 가격 **/
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
