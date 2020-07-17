package dev.mvc.coupon;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.coupon.CouponProc")
public class CouponProc implements CouponProcInter{
  
  @Autowired
  private CouponDAOInter couponDAO;

  public CouponProc(){
    System.out.println("--> CouponProc created.");
  }

  @Override
  public int create(CouponVO couponVO) {
    if(couponVO.getCpimg()==null) {
      couponVO.setCpimg("");
    }
    if(couponVO.getCpupimg()==null) {
      couponVO.setCpupimg("");
    }
    if(couponVO.getCpthumb()==null) {
      couponVO.setCpthumb("");
    }
    if(couponVO.getCpcate()==null) {
      couponVO.setCpcate("");
    }
    int cnt = this.couponDAO.create(couponVO);
    return cnt;
  }

  @Override
  public List<CouponVO> list() {
    List<CouponVO> list = this.couponDAO.list();
    return list;
  }

  @Override
  public CouponVO read(int couponno) {
    CouponVO couponVO = this.couponDAO.read(couponno);
    return couponVO;
  }

  @Override
  public int delete(int couponno) {
    int cnt = this.couponDAO.delete(couponno);
    return cnt;
  }
  
  @Override
  public int search_count() {
    int count = couponDAO.search_count();
    return count;
  }
  
  /** 
   * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
   * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
   *
   * @param listFile ��� ���ϸ� 
   * @param categrpno ī�װ���ȣ 
   * @param search_count �˻�(��ü) ���ڵ�� 
   * @param nowPage     ���� ������
   * @param word �˻���
   * @return ����¡ ���� ���ڿ�
   */ 
  @Override // html ������ ���ڿ� String�� return
public String pagingBox(String listFile, int search_count, int nowPage){ 
   // static ������ �����Ͽ� ���� ������
     int totalPage = (int)(Math.ceil((double)search_count/CouponConfig.RECORD_PER_PAGE)); // ��ü ������  
    int totalGrp = (int)(Math.ceil((double)totalPage/CouponConfig.PAGE_PER_BLOCK));// ��ü �׷� 
    int nowGrp = (int)(Math.ceil((double)nowPage/CouponConfig.PAGE_PER_BLOCK));    // ���� �׷� 
    int startPage = ((nowGrp - 1) * CouponConfig.PAGE_PER_BLOCK) + 1; // Ư�� �׷��� ������ ��� ����  
    int endPage = (nowGrp * CouponConfig.PAGE_PER_BLOCK);             // Ư�� �׷��� ������ ��� ����   
     
    StringBuffer str = new StringBuffer(); 
     
    str.append("<style type='text/css'>"); 
    str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}"); 
    str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}"); 
    str.append("  #paging A:hover{text-decoration:none; background-color: #FFFFFF; color:black; font-size: 1em;}"); 
    str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}"); 
    str.append("  .span_box_1{"); 
    str.append("    text-align: center;");    
    str.append("    font-size: 1em;"); 
    str.append("    border: 1px;"); 
    str.append("    border-style: solid;"); 
    str.append("    border-color: #cccccc;"); 
    str.append("    padding:1px 6px 1px 6px; /*��, ������, �Ʒ�, ����*/"); 
    str.append("    margin:1px 2px 1px 2px; /*��, ������, �Ʒ�, ����*/"); 
    str.append("  }"); 
    str.append("  .span_box_2{"); 
    str.append("    text-align: center;");    
    str.append("    background-color: #668db4;"); 
    str.append("    color: #FFFFFF;"); 
    str.append("    font-size: 1em;"); 
    str.append("    border: 1px;"); 
    str.append("    border-style: solid;"); 
    str.append("    border-color: #cccccc;"); 
    str.append("    padding:1px 6px 1px 6px; /*��, ������, �Ʒ�, ����*/"); 
    str.append("    margin:1px 2px 1px 2px; /*��, ������, �Ʒ�, ����*/"); 
    str.append("  }"); 
    str.append("</style>"); 
    str.append("<DIV id='paging'>"); 
//    str.append("���� ������: " + nowPage + " / " + totalPage + "  "); 
 
    // ���� 10�� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // ���� 2�׷��� ���: (2 - 1) * 10 = 1�׷��� ������ ������ 10
    // ���� 3�׷��� ���: (3 - 1) * 10 = 2�׷��� ������ ������ 20
    int _nowPage = (nowGrp-1) * CouponConfig.PAGE_PER_BLOCK;  
    if (nowGrp >= 2){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?nowPage="+_nowPage + "'>����</A></span>"); 
    } 
 
    for(int i=startPage; i<=endPage; i++){ 
      if (i > totalPage){ // ������ ������ ����, ������ �������� �Ѿ�� break;
        break; 
      } 
  
      if (nowPage == i){ 
        str.append("<span class='span_box_2'>"+i+"</span>"); // ���� ������, ���� 
      }else{
        // ���� �������� �ƴ� ������
        str.append("<span class='span_box_1'><A href='"+listFile+"?nowPage="+i+"'>"+i+"</A></span>");   
      } 
    } 
 
    // 10�� ���� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // ���� 1�׷��� ���: (1 * 10) + 1 = 2�׷��� ���� ������ 11
    // ���� 2�׷��� ���: (2 * 10) + 1 = 3�׷��� ���� ������ 21
    _nowPage = (nowGrp * CouponConfig.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?nowPage="+_nowPage+"'>����</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  }
 
 
  @Override
  public List<CouponVO> list_by_couponno_paging(HashMap<String, Object> map) {
    /* 
    ���������� ����� ���� ���ڵ� ��ȣ ��� ���ذ�, nowPage�� 1���� ����
    1 ������: nowPage = 1, (1 - 1) * 10 --> 0 
    2 ������: nowPage = 2, (2 - 1) * 10 --> 10
    3 ������: nowPage = 3, (3 - 1) * 10 --> 20
    */
    int beginOfPage = ((Integer)map.get("nowPage") - 1) * CouponConfig.RECORD_PER_PAGE;
   
    // ���� rownum, 1 ������: 1 / 2 ������: 11 / 3 ������: 21 
    int startNum = beginOfPage + 1; 
    //  ���� rownum, 1 ������: 10 / 2 ������: 20 / 3 ������: 30
    int endNum = beginOfPage + CouponConfig.RECORD_PER_PAGE;   
    /*
    1 ������: WHERE r >= 1 AND r <= 10
    2 ������: WHERE r >= 11 AND r <= 20
    3 ������: WHERE r >= 21 AND r <= 30
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
   
    List<CouponVO> list = couponDAO.list_by_couponno_paging(map);
    
    return list;
  }

  
}
